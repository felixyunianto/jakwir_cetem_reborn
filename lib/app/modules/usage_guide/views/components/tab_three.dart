import 'package:flutter/material.dart';
import 'package:jakwir_cetem_reborn/app/modules/usage_guide/views/components/list_item_tab.dart';

class TabThree extends StatefulWidget {
  const TabThree({super.key});

  @override
  State<TabThree> createState() => _TabThreeState();
}

class _TabThreeState extends State<TabThree> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListItemTab(
            textOne: "Siapa yang dapat melakukan pengajuan ?",
            child: Text(
                "Yang dapat melakukan pengajuan adalah pelapor yang sudah terdaftar. Terkecualli untuk pengajuan Kedatangan dapat dilakukan tanpa harus terdaftar terlebih dahulu.",
                style: TextStyle(
                  fontSize: 12,
                ))),
        const SizedBox(
          height: 20,
        ),
        ListItemTab(
            textOne:
                "Bagaimana alur proses pengajuan sampai dokumen diterima ?",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Alur proses pengajuan sebagai berikut : ",
                  style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "1. ",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Expanded(
                        child: Text(
                          "Pelapor memilih data yang akan dilakukan pelaporan/pengajuan.",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      )
                    ]),
                const SizedBox(
                  height: 8,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "2. ",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Expanded(
                        child: Text(
                          "Pelapor melengkapi data pelapor.",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      )
                    ]),
                const SizedBox(
                  height: 8,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "3. ",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Expanded(
                        child: Text(
                          "Pelapor mengupload data Dukung Pelapor",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      )
                    ]),
                const SizedBox(
                  height: 8,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "4. ",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Expanded(
                        child: Text(
                          "Pelapor melakukan kirim pelaporan",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      )
                    ]),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "5. ",
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                      child: Column(children: [
                        const Text(
                          "Admin pelayanan akan melakukan verifikasi dan memproses dokumen.",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "a. ",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Expanded(
                                  child: Text(
                                    "Jika proses verifikasi ditolak/pending maka akan mendapatkan notifikasi penolakan. Silahkan lengkapi sesuai permintaan dan Kirim Ulang data pelaporan.",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ))
                            ]),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "b. ",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Expanded(
                                  child: Text(
                                    "Jika verifikasi disetujui maka akan dilanjutkan sampai ke pencetakan Dokumen dan Siap ambil.",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ))
                            ])
                      ]),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "6. ",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Expanded(
                        child: Text(
                          "Pelapor mendapatkan notifikasi siap ambil",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      )
                    ]),
                const SizedBox(
                  height: 8,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "7. ",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Expanded(
                        child: Text(
                          "Pelapor datang ke Dinas Kependudukan dan Pencatatan Sipil dengan membawa data dukung.",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      )
                    ]),
                const SizedBox(
                  height: 8,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "8. ",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Expanded(
                        child: Text(
                          "Pelapor mendapatkan Dokumen/Akta yang sudah diajukan.",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      )
                    ]),
              ],
            ))
      ],
    );
  }
}
