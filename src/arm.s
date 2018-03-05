#include <asm.h>
.align 2


ARM_FUNC _enter_critical
    mrs r0, cpsr
    orr r1, r0, #(SR_NOIRQ | SR_NOFIQ)
    and r0, r0, #(SR_NOIRQ | SR_NOFIQ)
    msr cpsr_c, r1
    bx lr

ARM_FUNC _leave_critical
    mrs r1, cpsr
    bic r1, r1, #(SR_NOIRQ | SR_NOFIQ)
    orr r1, r0, r1
    msr cpsr_c, r1
    bx lr
