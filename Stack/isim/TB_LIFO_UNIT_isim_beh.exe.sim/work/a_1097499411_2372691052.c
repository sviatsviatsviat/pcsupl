/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/Master Degree/PCSUPL/Stack/TB_LIFO_UNIT.vhd";



void work_a_1097499411_2372691052_sub_2997101772_4163069965(char *t0, char *t1, char *t2, unsigned int t3, unsigned int t4, char *t5)
{
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    int64 t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    t8 = (0 + t3);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_delta(t5, t8, 1, 0LL);
    t9 = (t0 + 3088U);
    t10 = *((char **)t9);
    t13 = *((int64 *)t10);
    xsi_process_wait(t1, t13);

LAB5:    t9 = (t1 + 88U);
    t11 = *((char **)t9);
    t12 = (t11 + 2480U);
    *((unsigned int *)t12) = 1U;
    t14 = (t1 + 88U);
    t15 = *((char **)t14);
    t16 = (t15 + 0U);
    getcontext(t16);
    t17 = (t1 + 88U);
    t18 = *((char **)t17);
    t19 = (t18 + 2480U);
    t8 = *((unsigned int *)t19);
    if (t8 == 1)
        goto LAB6;

LAB7:    t20 = (t1 + 88U);
    t21 = *((char **)t20);
    t22 = (t21 + 2480U);
    *((unsigned int *)t22) = 3U;

LAB3:
LAB4:
LAB2:    t8 = (0 + t3);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_delta(t5, t8, 1, 0LL);
    t9 = (t0 + 3088U);
    t10 = *((char **)t9);
    t13 = *((int64 *)t10);
    xsi_process_wait(t1, t13);

LAB11:    t9 = (t1 + 88U);
    t11 = *((char **)t9);
    t12 = (t11 + 2480U);
    *((unsigned int *)t12) = 1U;
    t14 = (t1 + 88U);
    t15 = *((char **)t14);
    t16 = (t15 + 0U);
    getcontext(t16);
    t17 = (t1 + 88U);
    t18 = *((char **)t17);
    t19 = (t18 + 2480U);
    t8 = *((unsigned int *)t19);
    if (t8 == 1)
        goto LAB12;

LAB13:    t20 = (t1 + 88U);
    t21 = *((char **)t20);
    t22 = (t21 + 2480U);
    *((unsigned int *)t22) = 3U;

LAB9:
LAB10:
LAB8:    t8 = (0 + t3);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_delta(t5, t8, 1, 0LL);
    t9 = (t0 + 3088U);
    t10 = *((char **)t9);
    t13 = *((int64 *)t10);
    xsi_process_wait(t1, t13);

LAB17:    t9 = (t1 + 88U);
    t11 = *((char **)t9);
    t12 = (t11 + 2480U);
    *((unsigned int *)t12) = 1U;
    t14 = (t1 + 88U);
    t15 = *((char **)t14);
    t16 = (t15 + 0U);
    getcontext(t16);
    t17 = (t1 + 88U);
    t18 = *((char **)t17);
    t19 = (t18 + 2480U);
    t8 = *((unsigned int *)t19);
    if (t8 == 1)
        goto LAB18;

LAB19:    t20 = (t1 + 88U);
    t21 = *((char **)t20);
    t22 = (t21 + 2480U);
    *((unsigned int *)t22) = 3U;

LAB15:
LAB16:
LAB14:
LAB1:    return;
LAB6:    xsi_saveStackAndSuspend(t1);
    goto LAB7;

LAB12:    xsi_saveStackAndSuspend(t1);
    goto LAB13;

LAB18:    xsi_saveStackAndSuspend(t1);
    goto LAB19;

}

void work_a_1097499411_2372691052_sub_2265014488_4163069965(char *t0, char *t1, char *t2, char *t3, unsigned int t4, unsigned int t5, char *t6, char *t7, unsigned int t8, unsigned int t9, char *t10)
{
    char t12[24];
    char t13[16];
    char t18[16];
    char *t14;
    char *t15;
    int t16;
    unsigned int t17;
    char *t19;
    int t20;
    unsigned char t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    unsigned int t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    int64 t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;

LAB0:    t14 = (t13 + 0U);
    t15 = (t14 + 0U);
    *((int *)t15) = 1;
    t15 = (t14 + 4U);
    *((int *)t15) = 0;
    t15 = (t14 + 8U);
    *((int *)t15) = -1;
    t16 = (0 - 1);
    t17 = (t16 * -1);
    t17 = (t17 + 1);
    t15 = (t14 + 12U);
    *((unsigned int *)t15) = t17;
    t15 = (t18 + 0U);
    t19 = (t15 + 0U);
    *((int *)t19) = 1;
    t19 = (t15 + 4U);
    *((int *)t19) = 0;
    t19 = (t15 + 8U);
    *((int *)t19) = -1;
    t20 = (0 - 1);
    t17 = (t20 * -1);
    t17 = (t17 + 1);
    t19 = (t15 + 12U);
    *((unsigned int *)t19) = t17;
    t19 = (t12 + 4U);
    t21 = (t2 != 0);
    if (t21 == 1)
        goto LAB3;

LAB2:    t22 = (t12 + 12U);
    *((char **)t22) = t13;
    t17 = (0 + t4);
    t23 = (t6 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t18 + 12U);
    t28 = *((unsigned int *)t27);
    t28 = (t28 * 1U);
    memcpy(t26, t2, t28);
    t29 = (t18 + 12U);
    t30 = *((unsigned int *)t29);
    t31 = (1U * t30);
    xsi_driver_first_trans_delta(t6, t17, t31, 0LL);
    t17 = (0 + t8);
    t14 = (t10 + 56U);
    t15 = *((char **)t14);
    t23 = (t15 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = (unsigned char)3;
    xsi_driver_first_trans_delta(t10, t17, 1, 0LL);
    t14 = (t0 + 3088U);
    t15 = *((char **)t14);
    t32 = *((int64 *)t15);
    xsi_process_wait(t1, t32);

LAB7:    t14 = (t1 + 88U);
    t23 = *((char **)t14);
    t24 = (t23 + 2480U);
    *((unsigned int *)t24) = 1U;
    t25 = (t1 + 88U);
    t26 = *((char **)t25);
    t27 = (t26 + 0U);
    getcontext(t27);
    t29 = (t1 + 88U);
    t33 = *((char **)t29);
    t34 = (t33 + 2480U);
    t17 = *((unsigned int *)t34);
    if (t17 == 1)
        goto LAB8;

LAB9:    t35 = (t1 + 88U);
    t36 = *((char **)t35);
    t37 = (t36 + 2480U);
    *((unsigned int *)t37) = 3U;

LAB5:
LAB6:
LAB4:    t17 = (0 + t8);
    t14 = (t10 + 56U);
    t15 = *((char **)t14);
    t23 = (t15 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = (unsigned char)2;
    xsi_driver_first_trans_delta(t10, t17, 1, 0LL);
    t14 = (t0 + 3088U);
    t15 = *((char **)t14);
    t32 = *((int64 *)t15);
    xsi_process_wait(t1, t32);

LAB13:    t14 = (t1 + 88U);
    t23 = *((char **)t14);
    t24 = (t23 + 2480U);
    *((unsigned int *)t24) = 1U;
    t25 = (t1 + 88U);
    t26 = *((char **)t25);
    t27 = (t26 + 0U);
    getcontext(t27);
    t29 = (t1 + 88U);
    t33 = *((char **)t29);
    t34 = (t33 + 2480U);
    t17 = *((unsigned int *)t34);
    if (t17 == 1)
        goto LAB14;

LAB15:    t35 = (t1 + 88U);
    t36 = *((char **)t35);
    t37 = (t36 + 2480U);
    *((unsigned int *)t37) = 3U;

LAB11:
LAB12:
LAB10:
LAB1:    return;
LAB3:    *((char **)t19) = t2;
    goto LAB2;

LAB8:    xsi_saveStackAndSuspend(t1);
    goto LAB9;

LAB14:    xsi_saveStackAndSuspend(t1);
    goto LAB15;

}

static void work_a_1097499411_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 4192U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(124, ng0);
    t2 = (t0 + 4824);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(125, ng0);
    t2 = (t0 + 3088U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4000);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(126, ng0);
    t2 = (t0 + 4824);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(127, ng0);
    t2 = (t0 + 3088U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4000);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_1097499411_2372691052_p_1(char *t0)
{
    char t12[8];
    char t14[8];
    char t15[8];
    char t16[8];
    char *t1;
    char *t2;
    char *t3;
    int64 t4;
    int64 t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned char t13;
    unsigned char t17;
    unsigned char t18;
    unsigned char t19;
    unsigned char t20;

LAB0:    t1 = (t0 + 4440U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(134, ng0);
    t2 = (t0 + 3088U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t5 = (t4 / 2);
    t2 = (t0 + 4248);
    xsi_process_wait(t2, t5);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(136, ng0);
    t2 = (t0 + 4248);
    t3 = (t0 + 1152U);
    t6 = (t0 + 4888);
    work_a_1097499411_2372691052_sub_2997101772_4163069965(t0, t2, t3, 0U, 0U, t6);
    xsi_set_current_line(138, ng0);
    t2 = (t0 + 8668);
    t6 = (t0 + 4952);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(139, ng0);
    t2 = (t0 + 8676);
    t6 = (t0 + 5016);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(140, ng0);
    t2 = (t0 + 8684);
    t6 = (t0 + 5080);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(142, ng0);
    t2 = (t0 + 3088U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t5 = (t4 / 2);
    t2 = (t0 + 4248);
    xsi_process_wait(t2, t5);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(143, ng0);
    t2 = (t0 + 8692);
    t6 = (t0 + 5144);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 2U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(144, ng0);
    t2 = (t0 + 4248);
    t3 = (t0 + 3208U);
    t6 = *((char **)t3);
    t11 = (0 + 0U);
    t3 = (t6 + t11);
    memcpy(t12, t3, 2U);
    t7 = (t0 + 1472U);
    t8 = (t0 + 5208);
    t9 = (t0 + 1312U);
    t10 = (t0 + 5272);
    work_a_1097499411_2372691052_sub_2265014488_4163069965(t0, t2, t12, t7, 0U, 0U, t8, t9, 0U, 0U, t10);
    xsi_set_current_line(145, ng0);
    t2 = (t0 + 2312U);
    t3 = *((char **)t2);
    t2 = (t0 + 1832U);
    t6 = *((char **)t2);
    t13 = 1;
    if (8U == 8U)
        goto LAB14;

LAB15:    t13 = 0;

LAB16:    if (t13 == 0)
        goto LAB12;

LAB13:    xsi_set_current_line(147, ng0);
    t2 = (t0 + 8732);
    t6 = (t0 + 5144);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 2U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(148, ng0);
    t2 = (t0 + 4248);
    t3 = (t0 + 3208U);
    t6 = *((char **)t3);
    t11 = (0 + 0U);
    t3 = (t6 + t11);
    memcpy(t14, t3, 2U);
    t7 = (t0 + 1472U);
    t8 = (t0 + 5208);
    t9 = (t0 + 1312U);
    t10 = (t0 + 5272);
    work_a_1097499411_2372691052_sub_2265014488_4163069965(t0, t2, t14, t7, 0U, 0U, t8, t9, 0U, 0U, t10);
    xsi_set_current_line(149, ng0);
    t2 = (t0 + 2312U);
    t3 = *((char **)t2);
    t2 = (t0 + 1992U);
    t6 = *((char **)t2);
    t13 = 1;
    if (8U == 8U)
        goto LAB22;

LAB23:    t13 = 0;

LAB24:    if (t13 == 0)
        goto LAB20;

LAB21:    xsi_set_current_line(150, ng0);
    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t2 = (t0 + 1832U);
    t6 = *((char **)t2);
    t13 = 1;
    if (8U == 8U)
        goto LAB30;

LAB31:    t13 = 0;

LAB32:    if (t13 == 0)
        goto LAB28;

LAB29:    xsi_set_current_line(152, ng0);
    t2 = (t0 + 8810);
    t6 = (t0 + 5144);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 2U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(153, ng0);
    t2 = (t0 + 4248);
    t3 = (t0 + 3208U);
    t6 = *((char **)t3);
    t11 = (0 + 0U);
    t3 = (t6 + t11);
    memcpy(t15, t3, 2U);
    t7 = (t0 + 1472U);
    t8 = (t0 + 5208);
    t9 = (t0 + 1312U);
    t10 = (t0 + 5272);
    work_a_1097499411_2372691052_sub_2265014488_4163069965(t0, t2, t15, t7, 0U, 0U, t8, t9, 0U, 0U, t10);
    xsi_set_current_line(154, ng0);
    t2 = (t0 + 2312U);
    t3 = *((char **)t2);
    t2 = (t0 + 2152U);
    t6 = *((char **)t2);
    t13 = 1;
    if (8U == 8U)
        goto LAB38;

LAB39:    t13 = 0;

LAB40:    if (t13 == 0)
        goto LAB36;

LAB37:    xsi_set_current_line(155, ng0);
    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t2 = (t0 + 1992U);
    t6 = *((char **)t2);
    t13 = 1;
    if (8U == 8U)
        goto LAB46;

LAB47:    t13 = 0;

LAB48:    if (t13 == 0)
        goto LAB44;

LAB45:    xsi_set_current_line(157, ng0);
    t2 = (t0 + 8888);
    t6 = (t0 + 5144);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 2U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(158, ng0);
    t2 = (t0 + 4248);
    t3 = (t0 + 3208U);
    t6 = *((char **)t3);
    t11 = (0 + 0U);
    t3 = (t6 + t11);
    memcpy(t16, t3, 2U);
    t7 = (t0 + 1472U);
    t8 = (t0 + 5208);
    t9 = (t0 + 1312U);
    t10 = (t0 + 5272);
    work_a_1097499411_2372691052_sub_2265014488_4163069965(t0, t2, t16, t7, 0U, 0U, t8, t9, 0U, 0U, t10);
    xsi_set_current_line(159, ng0);
    t2 = (t0 + 2632U);
    t3 = *((char **)t2);
    t17 = *((unsigned char *)t3);
    t18 = (t17 == (unsigned char)3);
    if (t18 == 1)
        goto LAB54;

LAB55:    t13 = (unsigned char)0;

LAB56:    if (t13 == 0)
        goto LAB52;

LAB53:    xsi_set_current_line(161, ng0);
    t2 = (t0 + 8925);
    xsi_report(t2, 17U, (unsigned char)3);
    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    t8 = (t0 + 8694);
    xsi_report(t8, 38U, (unsigned char)3);
    goto LAB13;

LAB14:    t11 = 0;

LAB17:    if (t11 < 8U)
        goto LAB18;
    else
        goto LAB16;

LAB18:    t2 = (t3 + t11);
    t7 = (t6 + t11);
    if (*((unsigned char *)t2) != *((unsigned char *)t7))
        goto LAB15;

LAB19:    t11 = (t11 + 1);
    goto LAB17;

LAB20:    t8 = (t0 + 8734);
    xsi_report(t8, 38U, (unsigned char)3);
    goto LAB21;

LAB22:    t11 = 0;

LAB25:    if (t11 < 8U)
        goto LAB26;
    else
        goto LAB24;

LAB26:    t2 = (t3 + t11);
    t7 = (t6 + t11);
    if (*((unsigned char *)t2) != *((unsigned char *)t7))
        goto LAB23;

LAB27:    t11 = (t11 + 1);
    goto LAB25;

LAB28:    t8 = (t0 + 8772);
    xsi_report(t8, 38U, (unsigned char)3);
    goto LAB29;

LAB30:    t11 = 0;

LAB33:    if (t11 < 8U)
        goto LAB34;
    else
        goto LAB32;

LAB34:    t2 = (t3 + t11);
    t7 = (t6 + t11);
    if (*((unsigned char *)t2) != *((unsigned char *)t7))
        goto LAB31;

LAB35:    t11 = (t11 + 1);
    goto LAB33;

LAB36:    t8 = (t0 + 8812);
    xsi_report(t8, 38U, (unsigned char)3);
    goto LAB37;

LAB38:    t11 = 0;

LAB41:    if (t11 < 8U)
        goto LAB42;
    else
        goto LAB40;

LAB42:    t2 = (t3 + t11);
    t7 = (t6 + t11);
    if (*((unsigned char *)t2) != *((unsigned char *)t7))
        goto LAB39;

LAB43:    t11 = (t11 + 1);
    goto LAB41;

LAB44:    t8 = (t0 + 8850);
    xsi_report(t8, 38U, (unsigned char)3);
    goto LAB45;

LAB46:    t11 = 0;

LAB49:    if (t11 < 8U)
        goto LAB50;
    else
        goto LAB48;

LAB50:    t2 = (t3 + t11);
    t7 = (t6 + t11);
    if (*((unsigned char *)t2) != *((unsigned char *)t7))
        goto LAB47;

LAB51:    t11 = (t11 + 1);
    goto LAB49;

LAB52:    t2 = (t0 + 8890);
    xsi_report(t2, 35U, (unsigned char)3);
    goto LAB53;

LAB54:    t2 = (t0 + 2792U);
    t6 = *((char **)t2);
    t19 = *((unsigned char *)t6);
    t20 = (t19 == (unsigned char)3);
    t13 = t20;
    goto LAB56;

}


extern void work_a_1097499411_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1097499411_2372691052_p_0,(void *)work_a_1097499411_2372691052_p_1};
	static char *se[] = {(void *)work_a_1097499411_2372691052_sub_2997101772_4163069965,(void *)work_a_1097499411_2372691052_sub_2265014488_4163069965};
	xsi_register_didat("work_a_1097499411_2372691052", "isim/TB_LIFO_UNIT_isim_beh.exe.sim/work/a_1097499411_2372691052.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
