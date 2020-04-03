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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *WORK_P_3246521832;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    work_p_3246521832_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_a_0659104208_3212880686_init();
    work_a_4204489651_3212880686_init();
    work_a_3180608638_3212880686_init();
    work_a_1036003509_3212880686_init();
    work_a_3830602496_3212880686_init();
    work_a_4147992863_3212880686_init();
    work_a_3451200593_3212880686_init();
    work_a_3521726275_1181938964_init();
    work_a_1492859738_1181938964_init();
    work_a_1334466673_2372691052_init();


    xsi_register_tops("work_a_1334466673_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    WORK_P_3246521832 = xsi_get_engine_memory("work_p_3246521832");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");

    return xsi_run_simulation(argc, argv);

}
