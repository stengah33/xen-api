(*
 * Copyright (C) 2006-2012 Citrix Systems Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; version 2.1 only. with the special
 * exception on linking described in file LICENSE.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *)

open OUnit

let base_suite =
  "base_suite" >:::
  [
    Test_basic.test;
    Test_agility.test;
    Test_helpers.test;
    Test_datamodel_utils.test;
    Test_daemon_manager.test;
    Test_http.test;
    Test_pool_db_backup.test;
    Test_xapi_db_upgrade.test;
    Test_ca91480.test;
    Test_ha_vm_failover.test;
    Test_map_check.test;
    Test_pool_apply_edition.test;
    Test_pool_license.test;
    Test_features.test;
    Test_pool_restore_database.test;
    Test_pool_update.test;
    Test_platformdata.test;
    Test_sm_features.test;
    Test_gpu_group.test;
    Test_pci_helpers.test;
    Test_vgpu_type.test;
    Test_pgpu.test;
    Test_pgpu_helpers.test;
    Test_storage_migrate_state.test;
    Test_vm.test;
    Test_vm_helpers.test;
    Test_vm_migrate.test;
    Test_xenopsd_metadata.test;
    Test_workload_balancing.test;
    Test_cpuid_helpers.test;
    Test_pool_cpuinfo.test;
    (* Test_ca121350.test; *)
    Test_dbsync_master.test;
    Test_xapi_xenops.test;
    Test_no_migrate.test;
    Test_pvs_site.test;
    Test_pvs_proxy.test;
    Test_pvs_server.test;
    Test_pvs_cache_storage.test;
    Test_sdn_controller.test;
    Test_event.test;
    Test_extauth_plugin_ADpbis.test;
    Test_guest_agent.test;
    Test_xapi_vbd_helpers.test;
    Test_sr_update_vdis.test;
    Test_network_event_loop.test;
    Test_network.test;
    Test_pusb.test;
  ]

let () =
  (* exceeds 4MB limit in Travis *)
  Debug.disable ~level:Syslog.Debug "xapi";
  Suite_init.harness_init ();
  ounit2_of_ounit1 base_suite |> OUnit2.run_test_tt_main
