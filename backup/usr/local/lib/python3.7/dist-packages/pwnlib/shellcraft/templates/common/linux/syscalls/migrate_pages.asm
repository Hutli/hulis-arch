<%
import collections
import pwnlib.abi
import pwnlib.constants
import pwnlib.shellcraft
import six
%>
<%docstring>migrate_pages(pid, maxnode, old_nodes, new_nodes) -> str

Invokes the syscall migrate_pages.

See 'man 2 migrate_pages' for more information.

Arguments:
    pid(int): pid
    maxnode(unsigned): maxnode
    old_nodes(unsigned*): old_nodes
    new_nodes(unsigned*): new_nodes
Returns:
    long
</%docstring>
<%page args="pid=0, maxnode=0, old_nodes=0, new_nodes=0"/>
<%
    abi = pwnlib.abi.ABI.syscall()
    stack = abi.stack
    regs = abi.register_arguments[1:]
    allregs = pwnlib.shellcraft.registers.current()

    can_pushstr = []
    can_pushstr_array = []

    argument_names = ['pid', 'maxnode', 'old_nodes', 'new_nodes']
    argument_values = [pid, maxnode, old_nodes, new_nodes]

    # Load all of the arguments into their destination registers / stack slots.
    register_arguments = dict()
    stack_arguments = collections.OrderedDict()
    string_arguments = dict()
    dict_arguments = dict()
    array_arguments = dict()
    syscall_repr = []

    for name, arg in zip(argument_names, argument_values):
        if arg is not None:
            syscall_repr.append('%s=%r' % (name, arg))

        # If the argument itself (input) is a register...
        if arg in allregs:
            index = argument_names.index(name)
            if index < len(regs):
                target = regs[index]
                register_arguments[target] = arg
            elif arg is not None:
                stack_arguments[index] = arg

        # The argument is not a register.  It is a string value, and we
        # are expecting a string value
        elif name in can_pushstr and isinstance(arg, (six.binary_type, six.text_type)):
            if isinstance(arg, six.text_type):
                arg = arg.encode('utf-8')
            string_arguments[name] = arg

        # The argument is not a register.  It is a dictionary, and we are
        # expecting K:V paris.
        elif name in can_pushstr_array and isinstance(arg, dict):
            array_arguments[name] = ['%s=%s' % (k,v) for (k,v) in arg.items()]

        # The arguent is not a register.  It is a list, and we are expecting
        # a list of arguments.
        elif name in can_pushstr_array and isinstance(arg, (list, tuple)):
            array_arguments[name] = arg

        # The argument is not a register, string, dict, or list.
        # It could be a constant string ('O_RDONLY') for an integer argument,
        # an actual integer value, or a constant.
        else:
            index = argument_names.index(name)
            if index < len(regs):
                target = regs[index]
                register_arguments[target] = arg
            elif arg is not None:
                stack_arguments[target] = arg

    # Some syscalls have different names on various architectures.
    # Determine which syscall number to use for the current architecture.
    for syscall in ['SYS_migrate_pages']:
        if hasattr(pwnlib.constants, syscall):
            break
    else:
        raise Exception("Could not locate any syscalls: %r" % syscalls)
%>
    /* migrate_pages(${', '.join(syscall_repr)}) */
%for name, arg in string_arguments.items():
    ${pwnlib.shellcraft.pushstr(arg, append_null=(b'\x00' not in arg))}
    ${pwnlib.shellcraft.mov(regs[argument_names.index(name)], abi.stack)}
%endfor
%for name, arg in array_arguments.items():
    ${pwnlib.shellcraft.pushstr_array(regs[argument_names.index(name)], arg)}
%endfor
%for name, arg in stack_arguments.items():
    ${pwnlib.shellcraft.push(arg)}
%endfor
    ${pwnlib.shellcraft.setregs(register_arguments)}
    ${pwnlib.shellcraft.syscall(syscall)}