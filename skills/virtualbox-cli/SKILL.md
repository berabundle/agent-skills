---
name: virtualbox-cli
description: "Use when managing VirtualBox VMs on Linux via VBoxManage: create, modify, attach storage/ISOs, and configure networking."
---

Manage VirtualBox virtual machines from the Linux command line using `VBoxManage`.

## When to use
- User wants to create or modify VirtualBox VMs without the GUI.
- User needs storage controllers, disks, or ISOs attached via CLI.
- User needs to change CPU, RAM, graphics, firmware, or boot order.
- User needs to configure networking (NAT, bridged, host-only) from CLI.

## Inputs it expects
- VM identity: name or UUID.
- Target OS type: from `VBoxManage list ostypes`.
- Hardware: memory (MB), CPUs, VRAM, firmware, graphics controller.
- Storage: disk size/path, ISO path, controller name/type/port.
- Networking: NIC mode, adapter name, port-forward rules.

## Step-by-step method
1) Verify CLI is present and list available VM metadata.
   - `VBoxManage --version`
   - `VBoxManage list vms`
   - `VBoxManage list ostypes`
2) Create a VM shell and register it.
   - `VBoxManage createvm --name "<vm>" --ostype "<ostype>" --register`
3) Set core VM hardware (RAM, CPU, firmware, graphics, boot order).
   - `VBoxManage modifyvm "<vm>" --memory 4096 --cpus 2 --vram 128 --firmware efi`
   - `VBoxManage modifyvm "<vm>" --graphicscontroller vmsvga --boot1 dvd --boot2 disk`
4) Create and attach storage (disk + ISO).
   - `VBoxManage createmedium disk --filename "/path/<vm>.vdi" --size 40000`
   - `VBoxManage storagectl "<vm>" --name "SATA" --add sata --controller IntelAhci`
   - `VBoxManage storageattach "<vm>" --storagectl "SATA" --port 0 --device 0 --type hdd --medium "/path/<vm>.vdi"`
   - `VBoxManage storageattach "<vm>" --storagectl "SATA" --port 1 --device 0 --type dvddrive --medium "/path/installer.iso"`
5) Configure networking.
   - NAT: `VBoxManage modifyvm "<vm>" --nic1 nat`
   - Bridged: `VBoxManage modifyvm "<vm>" --nic1 bridged --bridgeadapter1 "<host-iface>"`
   - Host-only: `VBoxManage modifyvm "<vm>" --nic1 hostonly --hostonlyadapter1 "<vboxnet0>"`
6) Start, stop, and inspect.
   - `VBoxManage startvm "<vm>" --type headless`
   - `VBoxManage controlvm "<vm>" acpipowerbutton`
   - `VBoxManage showvminfo "<vm>" --details`
7) Modify existing VM settings (repeat steps 3-5 for changes).
8) Optional: snapshots or export/import.
   - `VBoxManage snapshot "<vm>" take "<snap>"`
   - `VBoxManage export "<vm>" --output "/path/<vm>.ova"`
   - `VBoxManage import "/path/<vm>.ova"`

## Output format requirements
- Provide concrete `VBoxManage` commands with placeholders replaced.
- State any required paths (disk, ISO, base folder) explicitly.
- Call out VM names/UUIDs and the host interface names used.

## Validation checklist
- `VBoxManage showvminfo "<vm>" --details` reflects CPU/RAM/firmware/graphics changes.
- `VBoxManage list hdds` includes the created disk.
- `VBoxManage storageattach` shows both disk and ISO on the intended controller/port.
- `VBoxManage list vms` shows the VM registered.

## Related skills
- `cli-guidelines` - consistent CLI response structure and safety notes.
- `curl` - download ISO images or guest tools bundles.
- `ssh` - access guest OS once networking is configured.
- `tmux` - keep long-running headless workflows alive.

## Smoke test
- `VBoxManage --version`
- `VBoxManage list vms`
