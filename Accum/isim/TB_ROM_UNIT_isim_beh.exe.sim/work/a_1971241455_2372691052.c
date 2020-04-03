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
static const char *ng0 = "E:/Master Degree/PCSUPL/Accum/TB_ROM_UNIT.vhd";
extern char *WORK_P_0606889405;



static void work_a_1971241455_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(91, ng0);

LAB3:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t3 = (11 - 11);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 5032);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 4U);
    xsi_driver_first_trans_fast(t6);

LAB2:    t11 = (t0 + 4936);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1971241455_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    int t7;
    char *t8;
    int t9;
    char *t10;
    int t11;
    char *t12;
    int t13;
    char *t14;
    int t15;
    char *t16;
    int t17;
    char *t18;
    int t19;
    char *t20;
    int t21;
    char *t22;
    int t23;
    char *t24;
    int t25;
    char *t26;
    int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    t1 = (t0 + 4120U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t2 = ((WORK_P_0606889405) + 1168U);
    t4 = *((char **)t2);
    t5 = xsi_mem_cmp(t4, t3, 4U);
    if (t5 == 1)
        goto LAB5;

LAB18:    t2 = ((WORK_P_0606889405) + 1288U);
    t6 = *((char **)t2);
    t7 = xsi_mem_cmp(t6, t3, 4U);
    if (t7 == 1)
        goto LAB6;

LAB19:    t2 = ((WORK_P_0606889405) + 1408U);
    t8 = *((char **)t2);
    t9 = xsi_mem_cmp(t8, t3, 4U);
    if (t9 == 1)
        goto LAB7;

LAB20:    t2 = ((WORK_P_0606889405) + 1648U);
    t10 = *((char **)t2);
    t11 = xsi_mem_cmp(t10, t3, 4U);
    if (t11 == 1)
        goto LAB8;

LAB21:    t2 = ((WORK_P_0606889405) + 1528U);
    t12 = *((char **)t2);
    t13 = xsi_mem_cmp(t12, t3, 4U);
    if (t13 == 1)
        goto LAB9;

LAB22:    t2 = ((WORK_P_0606889405) + 1768U);
    t14 = *((char **)t2);
    t15 = xsi_mem_cmp(t14, t3, 4U);
    if (t15 == 1)
        goto LAB10;

LAB23:    t2 = ((WORK_P_0606889405) + 1888U);
    t16 = *((char **)t2);
    t17 = xsi_mem_cmp(t16, t3, 4U);
    if (t17 == 1)
        goto LAB11;

LAB24:    t2 = ((WORK_P_0606889405) + 2008U);
    t18 = *((char **)t2);
    t19 = xsi_mem_cmp(t18, t3, 4U);
    if (t19 == 1)
        goto LAB12;

LAB25:    t2 = ((WORK_P_0606889405) + 2128U);
    t20 = *((char **)t2);
    t21 = xsi_mem_cmp(t20, t3, 4U);
    if (t21 == 1)
        goto LAB13;

LAB26:    t2 = ((WORK_P_0606889405) + 2248U);
    t22 = *((char **)t2);
    t23 = xsi_mem_cmp(t22, t3, 4U);
    if (t23 == 1)
        goto LAB14;

LAB27:    t2 = ((WORK_P_0606889405) + 2368U);
    t24 = *((char **)t2);
    t25 = xsi_mem_cmp(t24, t3, 4U);
    if (t25 == 1)
        goto LAB15;

LAB28:    t2 = ((WORK_P_0606889405) + 2488U);
    t26 = *((char **)t2);
    t27 = xsi_mem_cmp(t26, t3, 4U);
    if (t27 == 1)
        goto LAB16;

LAB29:
LAB17:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 5096);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = (unsigned char)12;
    xsi_driver_first_trans_fast(t2);

LAB4:    xsi_set_current_line(94, ng0);

LAB33:    t2 = (t0 + 4952);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB34;

LAB1:    return;
LAB5:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 5096);
    t28 = (t2 + 56U);
    t29 = *((char **)t28);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    *((unsigned char *)t31) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB6:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 5096);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = (unsigned char)1;
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB7:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 5096);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB8:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 5096);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB9:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 5096);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = (unsigned char)4;
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB10:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 5096);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = (unsigned char)5;
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB11:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 5096);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = (unsigned char)6;
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB12:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 5096);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = (unsigned char)7;
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB13:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 5096);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = (unsigned char)8;
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB14:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 5096);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = (unsigned char)9;
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB15:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 5096);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = (unsigned char)10;
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB16:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 5096);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = (unsigned char)11;
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB30:;
LAB31:    t3 = (t0 + 4952);
    *((int *)t3) = 0;
    goto LAB2;

LAB32:    goto LAB31;

LAB34:    goto LAB32;

}

static void work_a_1971241455_2372691052_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 4368U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(124, ng0);
    t2 = (t0 + 5160);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(125, ng0);
    t2 = (t0 + 2768U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4176);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(126, ng0);
    t2 = (t0 + 5160);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(127, ng0);
    t2 = (t0 + 2768U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4176);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_1971241455_2372691052_p_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int64 t4;
    int64 t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    int t12;
    unsigned char t13;
    char *t14;
    int t15;

LAB0:    t1 = (t0 + 4616U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(136, ng0);
    t2 = (t0 + 2768U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t5 = (t4 / 2);
    t2 = (t0 + 4424);
    xsi_process_wait(t2, t5);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(139, ng0);
    t2 = (t0 + 5224);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(139, ng0);
    t2 = (t0 + 2768U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 4424);
    xsi_process_wait(t2, t4);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(140, ng0);
    t2 = (t0 + 5224);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(140, ng0);
    t2 = (t0 + 2768U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 4424);
    xsi_process_wait(t2, t4);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(143, ng0);

LAB16:    t2 = (t0 + 2312U);
    t3 = *((char **)t2);
    t9 = *((unsigned char *)t3);
    t10 = (t9 != (unsigned char)11);
    if (t10 != 0)
        goto LAB17;

LAB19:    xsi_set_current_line(177, ng0);
    t2 = (t0 + 2768U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 4424);
    xsi_process_wait(t2, t4);

LAB46:    *((char **)t1) = &&LAB47;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB17:    xsi_set_current_line(144, ng0);
    t2 = (t0 + 5288);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(144, ng0);
    t2 = (t0 + 2768U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 4424);
    xsi_process_wait(t2, t4);

LAB22:    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB18:;
LAB20:    xsi_set_current_line(145, ng0);
    t2 = (t0 + 5288);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(147, ng0);
    t2 = (t0 + 5352);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(147, ng0);
    t2 = (t0 + 2768U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 4424);
    xsi_process_wait(t2, t4);

LAB26:    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB21:    goto LAB20;

LAB23:    goto LAB21;

LAB24:    xsi_set_current_line(148, ng0);
    t2 = (t0 + 5352);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(150, ng0);
    t2 = (t0 + 2312U);
    t3 = *((char **)t2);
    t9 = *((unsigned char *)t3);
    t10 = (t9 == (unsigned char)5);
    if (t10 != 0)
        goto LAB28;

LAB30:    xsi_set_current_line(166, ng0);
    t2 = (t0 + 5416);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(167, ng0);
    t2 = (t0 + 5480);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);

LAB29:    xsi_set_current_line(170, ng0);
    t2 = (t0 + 2888U);
    t3 = *((char **)t2);
    t12 = *((int *)t3);
    t9 = (t12 < 100);
    if (t9 == 0)
        goto LAB38;

LAB39:    xsi_set_current_line(173, ng0);
    t2 = (t0 + 5544);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(173, ng0);
    t2 = (t0 + 2768U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 4424);
    xsi_process_wait(t2, t4);

LAB42:    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB25:    goto LAB24;

LAB27:    goto LAB25;

LAB28:    xsi_set_current_line(151, ng0);
    t2 = (t0 + 2888U);
    t6 = *((char **)t2);
    t12 = *((int *)t6);
    t13 = (t12 < 3);
    if (t13 != 0)
        goto LAB31;

LAB33:    t2 = (t0 + 2888U);
    t3 = *((char **)t2);
    t12 = *((int *)t3);
    t9 = (t12 < 4);
    if (t9 != 0)
        goto LAB34;

LAB35:    t2 = (t0 + 2888U);
    t3 = *((char **)t2);
    t12 = *((int *)t3);
    t9 = (t12 < 5);
    if (t9 != 0)
        goto LAB36;

LAB37:    xsi_set_current_line(161, ng0);
    t2 = (t0 + 5416);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(162, ng0);
    t2 = (t0 + 5480);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);

LAB32:    xsi_set_current_line(164, ng0);
    t2 = (t0 + 2888U);
    t3 = *((char **)t2);
    t12 = *((int *)t3);
    t15 = (t12 + 1);
    t2 = (t0 + 2888U);
    t6 = *((char **)t2);
    t2 = (t6 + 0);
    *((int *)t2) = t15;
    goto LAB29;

LAB31:    xsi_set_current_line(152, ng0);
    t2 = (t0 + 5416);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t14 = *((char **)t11);
    *((unsigned char *)t14) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(153, ng0);
    t2 = (t0 + 5480);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB32;

LAB34:    xsi_set_current_line(155, ng0);
    t2 = (t0 + 5416);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(156, ng0);
    t2 = (t0 + 5480);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB32;

LAB36:    xsi_set_current_line(158, ng0);
    t2 = (t0 + 5416);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(159, ng0);
    t2 = (t0 + 5480);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB32;

LAB38:    t2 = (t0 + 8268);
    xsi_report(t2, 25U, 2);
    goto LAB39;

LAB40:    xsi_set_current_line(174, ng0);
    t2 = (t0 + 5544);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB16;

LAB41:    goto LAB40;

LAB43:    goto LAB41;

LAB44:    xsi_set_current_line(179, ng0);
    t2 = (t0 + 8293);
    xsi_report(t2, 17U, (unsigned char)3);
    goto LAB2;

LAB45:    goto LAB44;

LAB47:    goto LAB45;

}


extern void work_a_1971241455_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1971241455_2372691052_p_0,(void *)work_a_1971241455_2372691052_p_1,(void *)work_a_1971241455_2372691052_p_2,(void *)work_a_1971241455_2372691052_p_3};
	xsi_register_didat("work_a_1971241455_2372691052", "isim/TB_ROM_UNIT_isim_beh.exe.sim/work/a_1971241455_2372691052.didat");
	xsi_register_executes(pe);
}
