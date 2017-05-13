SET(FREERTOS_COMPONENTS kernel)

IF(NOT FreeRTOS_FIND_COMPONENTS) 
    SET(FreeRTOS_FIND_COMPONENTS kernel)
    MESSAGE(STATUS "No FreeRTOS components specified, using default: ${FreeRTOS_FIND_COMPONENTS}")
    MESSAGE(STATUS "Supported FreeRTOS components: ${FREERTOS_COMPONENTS}")
ENDIF()

SET(FREERTOS_kernel_INCLUDE_DIR 
    ${FREERTOS_ROOT}/Source/include
)

SET(FREERTOS_kernel_SOURCES
  ${FREERTOS_ROOT}/Source/list.c
  ${FREERTOS_ROOT}/Source/queue.c
  ${FREERTOS_ROOT}/Source/timers.c
  ${FREERTOS_ROOT}/Source/tasks.c
  ${FREERTOS_ROOT}/Source/event_groups.c
)

IF(STM32_FAMILY STREQUAL "F4")
    LIST(APPEND FREERTOS_kernel_INCLUDE_DIR ${FREERTOS_ROOT}/Source/portable/GCC/ARM_CM4F)
    LIST(APPEND FREERTOS_kernel_SOURCES ${FREERTOS_ROOT}/Source/portable/GCC/ARM_CM4F/port.c)
    LIST(APPEND FREERTOS_kernel_SOURCES ${FREERTOS_ROOT}/Source/portable/MemMang/heap_4.c)
ENDIF()
