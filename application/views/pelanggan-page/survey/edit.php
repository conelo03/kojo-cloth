<?php $this->load->view('pelanggan-page/template/header');?>
<?php $this->load->view('pelanggan-page/template/sidebar');?>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="#">Kelola Survey</a></div>
        <div class="breadcrumb-item">Edit Survey</div>
      </div>
    </div>

    <div class="section-body">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <form action="<?= base_url('edit-survey-pelanggan/'.$s['id_survey']); ?>" method="post" enctype="multipart/form-data">
              <div class="card-header">
                <h4>Form Edit Survey</h4>
              </div>
              <div class="card-body">
                <div class="form-group">
                  <label>Tgl Survey</label>
                  <input type="date" name="tanggal_survey" class="form-control" value="<?= set_value('tanggal_survey', $s['tanggal_survey']); ?>" required="">
                  <?= form_error('tanggal_survey', '<span class="text-danger small">', '</span>'); ?>
                </div>
                <div class="form-group">
                  <label class="d-block">1.	Secara keseluruhan, seberapa puaskah Anda dengan acara ini?</label>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="keseluruhan" value="5" id="keseluruhan1" <?= $s['keseluruhan'] == '5' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="keseluruhan1">
                      Sangat Puas
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="keseluruhan" value="4" id="keseluruhan2" <?= $s['keseluruhan'] == '4' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="keseluruhan2">
                      Puas
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="keseluruhan" value="3" id="keseluruhan3" <?= $s['keseluruhan'] == '3' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="keseluruhan3">
                      Biasa
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="keseluruhan" value="4" id="keseluruhan4" <?= $s['keseluruhan'] == '4' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="keseluruhan4">
                      Tidak Puas
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="keseluruhan" value="1" id="keseluruhan5" <?= $s['keseluruhan'] == '1' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="keseluruhan5">
                      Sangat Tidak Puas
                    </label>
                  </div>
                </div>
                <p>2.	Beri peringkat tingkat kepuasan Anda terkait aspek berikut dari acara kami.</p>
                <div class="row">
                  <div class="form-group col-md-3">
                    <label class="d-block">Tanggal dan Waktu</label>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="aspek_tanggal" value="5" id="aspek_tanggal1" <?= $s['aspek_tanggal'] == '5' ? 'checked' : '' ?>>
                      <label class="form-check-label" for="aspek_tanggal1">
                        Sangat Puas
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="aspek_tanggal" value="4" id="aspek_tanggal2" <?= $s['aspek_tanggal'] == '4' ? 'checked' : '' ?>>
                      <label class="form-check-label" for="aspek_tanggal2">
                        Puas
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="aspek_tanggal" value="3" id="aspek_tanggal3" <?= $s['aspek_tanggal'] == '3' ? 'checked' : '' ?>>
                      <label class="form-check-label" for="aspek_tanggal3">
                        Biasa
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="aspek_tanggal" value="2" id="aspek_tanggal4" <?= $s['aspek_tanggal'] == '2' ? 'checked' : '' ?>>
                      <label class="form-check-label" for="aspek_tanggal4">
                        Tidak Puas
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="aspek_tanggal" value="1" id="aspek_tanggal5" <?= $s['aspek_tanggal'] == '1' ? 'checked' : '' ?>>
                      <label class="form-check-label" for="aspek_tanggal5">
                        Sangat Tidak Puas
                      </label>
                    </div>
                  </div>
                  <div class="form-group col-md-3">
                    <label class="d-block">Lokasi</label>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="aspek_lokasi" value="5" id="aspek_lokasi1" <?= $s['aspek_lokasi'] == '5' ? 'checked' : '' ?>>
                      <label class="form-check-label" for="aspek_lokasi1">
                        Sangat Puas
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="aspek_lokasi" value="4" id="aspek_lokasi2" <?= $s['aspek_lokasi'] == '4' ? 'checked' : '' ?>>
                      <label class="form-check-label" for="aspek_lokasi2">
                        Puas
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="aspek_lokasi" value="3" id="aspek_lokasi3" <?= $s['aspek_lokasi'] == '3' ? 'checked' : '' ?>>
                      <label class="form-check-label" for="aspek_lokasi3">
                        Biasa
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="aspek_lokasi" value="2" id="aspek_lokasi4" <?= $s['aspek_lokasi'] == '2' ? 'checked' : '' ?>>
                      <label class="form-check-label" for="aspek_lokasi4">
                        Tidak Puas
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="aspek_lokasi" value="1" id="aspek_lokasi5" <?= $s['aspek_lokasi'] == '1' ? 'checked' : '' ?>>
                      <label class="form-check-label" for="aspek_lokasi5">
                        Sangat Tidak Puas
                      </label>
                    </div>
                  </div>
                  <div class="form-group col-md-3">
                    <label class="d-block">Sesi</label>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="aspek_sesi" value="5" id="aspek_sesi1" <?= $s['aspek_sesi'] == '5' ? 'checked' : '' ?>>
                      <label class="form-check-label" for="aspek_sesi1">
                        Sangat Puas
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="aspek_sesi" value="4" id="aspek_sesi2" <?= $s['aspek_sesi'] == '4' ? 'checked' : '' ?>>
                      <label class="form-check-label" for="aspek_sesi2">
                        Puas
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="aspek_sesi" value="3" id="aspek_sesi3" <?= $s['aspek_sesi'] == '3' ? 'checked' : '' ?>>
                      <label class="form-check-label" for="aspek_sesi3">
                        Biasa
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="aspek_sesi" value="2" id="aspek_sesi4" <?= $s['aspek_sesi'] == '2' ? 'checked' : '' ?>>
                      <label class="form-check-label" for="aspek_sesi4">
                        Tidak Puas
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="aspek_sesi" value="1" id="aspek_sesi5" <?= $s['aspek_sesi'] == '1' ? 'checked' : '' ?>>
                      <label class="form-check-label" for="aspek_sesi5">
                        Sangat Tidak Puas
                      </label>
                    </div>
                  </div>
                  <div class="form-group col-md-3">
                    <label class="d-block">Pembicara</label>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="pembicara" value="5" id="pembicara1" <?= $s['pembicara'] == '5' ? 'checked' : '' ?>>
                      <label class="form-check-label" for="pembicara1">
                        Sangat Puas
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="pembicara" value="4" id="pembicara2" <?= $s['pembicara'] == '4' ? 'checked' : '' ?>>
                      <label class="form-check-label" for="pembicara2">
                        Puas
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="pembicara" value="3" id="pembicara3" <?= $s['pembicara'] == '3' ? 'checked' : '' ?>>
                      <label class="form-check-label" for="pembicara3">
                        Biasa
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="pembicara" value="2" id="pembicara4" <?= $s['pembicara'] == '2' ? 'checked' : '' ?>>
                      <label class="form-check-label" for="pembicara4">
                        Tidak Puas
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="pembicara" value="1" id="pembicara5" <?= $s['pembicara'] == '1' ? 'checked' : '' ?>>
                      <label class="form-check-label" for="pembicara5">
                        Sangat Tidak Puas
                      </label>
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <label class="d-block">3.	Apakah ini kali pertama Anda mengetahui brand kami?</label>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="kali_pertama" value="Ya" id="kali_pertama1" <?= $s['kali_pertama'] == 'Ya' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="kali_pertama1">
                      Ya
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="kali_pertama" value="Tidak" id="kali_pertama2" <?= $s['kali_pertama'] == 'Tidak' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="kali_pertama2">
                      Tidak
                    </label>
                  </div>
                </div>

                <div class="form-group">
                  <label class="d-block">4.	Berdasarkan pengalaman Anda dengan brand kami, seberapa besar kemungkinan Anda untuk memesan produk kami? Skala 1 – 10</label>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="kemungkinan_memesan_produk" value="1" id="kemungkinan_memesan_produk1" <?= $s['kemungkinan_memesan_produk'] == '1' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="kemungkinan_memesan_produk1">
                      1 Sangat Tidak Mungkin
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="kemungkinan_memesan_produk" value="2" id="kemungkinan_memesan_produk2" <?= $s['kemungkinan_memesan_produk'] == '2' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="kemungkinan_memesan_produk2">
                      2
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="kemungkinan_memesan_produk" value="3" id="kemungkinan_memesan_produk3" <?= $s['kemungkinan_memesan_produk'] == '3' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="kemungkinan_memesan_produk3">
                      3
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="kemungkinan_memesan_produk" value="4" id="kemungkinan_memesan_produk4" <?= $s['kemungkinan_memesan_produk'] == '4' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="kemungkinan_memesan_produk4">
                      4
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="kemungkinan_memesan_produk" value="5" id="kemungkinan_memesan_produk5" <?= $s['kemungkinan_memesan_produk'] == '5' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="kemungkinan_memesan_produk5">
                      5
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="kemungkinan_memesan_produk" value="6" id="kemungkinan_memesan_produk6" <?= $s['kemungkinan_memesan_produk'] == '6' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="kemungkinan_memesan_produk6">
                      6
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="kemungkinan_memesan_produk" value="7" id="kemungkinan_memesan_produk7" <?= $s['kemungkinan_memesan_produk'] == '7' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="kemungkinan_memesan_produk7">
                      7
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="kemungkinan_memesan_produk" value="8" id="kemungkinan_memesan_produk8" <?= $s['kemungkinan_memesan_produk'] == '8' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="kemungkinan_memesan_produk8">
                      8
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="kemungkinan_memesan_produk" value="9" id="kemungkinan_memesan_produk9" <?= $s['kemungkinan_memesan_produk'] == '9' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="kemungkinan_memesan_produk9">
                      9
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="kemungkinan_memesan_produk" value="10" id="kemungkinan_memesan_produk10" <?= $s['kemungkinan_memesan_produk'] == '10' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="kemungkinan_memesan_produk10">
                      10 Sangat Mungkin
                    </label>
                  </div>
                </div>

                <div class="form-group">
                  <label class="d-block">5.	Seberapa besar kemungkinan Anda merekomendasikan brand kami kepada orang lain? Skala 1 – 10</label>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="merekomendasikan_ke_orang_lain" value="1" id="merekomendasikan_ke_orang_lain1" <?= $s['merekomendasikan_ke_orang_lain'] == '1' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="merekomendasikan_ke_orang_lain1">
                      1 Sangat Tidak Mungkin
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="merekomendasikan_ke_orang_lain" value="2" id="merekomendasikan_ke_orang_lain2" <?= $s['merekomendasikan_ke_orang_lain'] == '2' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="merekomendasikan_ke_orang_lain2">
                      2
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="merekomendasikan_ke_orang_lain" value="3" id="merekomendasikan_ke_orang_lain3" <?= $s['merekomendasikan_ke_orang_lain'] == '3' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="merekomendasikan_ke_orang_lain3">
                      3
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="merekomendasikan_ke_orang_lain" value="4" id="merekomendasikan_ke_orang_lain4" <?= $s['merekomendasikan_ke_orang_lain'] == '4' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="merekomendasikan_ke_orang_lain4">
                      4
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="merekomendasikan_ke_orang_lain" value="5" id="merekomendasikan_ke_orang_lain5" <?= $s['merekomendasikan_ke_orang_lain'] == '5' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="merekomendasikan_ke_orang_lain5">
                      5
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="merekomendasikan_ke_orang_lain" value="6" id="merekomendasikan_ke_orang_lain6" <?= $s['merekomendasikan_ke_orang_lain'] == '6' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="merekomendasikan_ke_orang_lain6">
                      6
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="merekomendasikan_ke_orang_lain" value="7" id="merekomendasikan_ke_orang_lain7" <?= $s['merekomendasikan_ke_orang_lain'] == '7' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="merekomendasikan_ke_orang_lain7">
                      7
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="merekomendasikan_ke_orang_lain" value="8" id="merekomendasikan_ke_orang_lain8" <?= $s['merekomendasikan_ke_orang_lain'] == '8' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="merekomendasikan_ke_orang_lain8">
                      8
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="merekomendasikan_ke_orang_lain" value="9" id="merekomendasikan_ke_orang_lain9" <?= $s['merekomendasikan_ke_orang_lain'] == '9' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="merekomendasikan_ke_orang_lain9">
                      9
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="merekomendasikan_ke_orang_lain" value="10" id="merekomendasikan_ke_orang_lain10" <?= $s['merekomendasikan_ke_orang_lain'] == '10' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="merekomendasikan_ke_orang_lain10">
                      10 Sangat Mungkin
                    </label>
                  </div>
                </div>

                <div class="form-group">
                  <label class="d-block">6.	Bagaimana kamu pertama kali mengetahui brand kami?</label>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="pertama_kali_tahu" value="Instagram" id="pertama_kali_tahu1" <?= $s['pertama_kali_tahu'] == 'Instagram' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="pertama_kali_tahu1">
                      Instagram
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="pertama_kali_tahu" value="Tiktok" id="pertama_kali_tahu2" <?= $s['pertama_kali_tahu'] == 'Tiktok' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="pertama_kali_tahu2">
                      Tiktok
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="pertama_kali_tahu" value="Youtube" id="pertama_kali_tahu3" <?= $s['pertama_kali_tahu'] == 'Youtube' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="pertama_kali_tahu3">
                      Youtube
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="pertama_kali_tahu" value="Pesan Siaran" id="pertama_kali_tahu4" <?= $s['pertama_kali_tahu'] == 'Pesan Siaran' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="pertama_kali_tahu4">
                      Pesan Siaran
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="pertama_kali_tahu" value="Radio" id="pertama_kali_tahu5" <?= $s['pertama_kali_tahu'] == 'Radio' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="pertama_kali_tahu5">
                      Radio
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="pertama_kali_tahu" value="Lainnya" id="pertama_kali_tahu6" <?= $s['pertama_kali_tahu'] == 'Lainnya' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="pertama_kali_tahu6">
                      Lainnya
                    </label>
                  </div>
                </div>

                <div class="form-group">
                  <label class="d-block">7.	Jika kami mengadakan acara lagi, tema apa yang paling menarik untuk kamu?</label>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="rekomendasi_tema" value="Teknologi" id="rekomendasi_tema1" <?= $s['rekomendasi_tema'] == 'Teknologi' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="rekomendasi_tema1">
                      Teknologi
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="rekomendasi_tema" value="Edukasi" id="rekomendasi_tema2" <?= $s['rekomendasi_tema'] == 'Edukasi' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="rekomendasi_tema2">
                      Edukasi
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="rekomendasi_tema" value="Hiburan" id="rekomendasi_tema3" <?= $s['rekomendasi_tema'] == 'Hiburan' ? 'checked' : '' ?>>
                    <label class="form-check-label" for="rekomendasi_tema3">
                      Hiburan
                    </label>
                  </div>
                </div>
                
                <div class="form-group">
                  <label>8.	Apakah anda memiliki saran untuk kami agar dapat meningkatkan acara dan kualitas produk di masa mendatang?</label>
                  <textarea type="text" name="saran" class="form-control" required=""><?= $s['saran'] ?></textarea>
                </div>
              </div>

              <div class="card-footer text-right">
                <a href="<?= base_url('my-survey');?>" class="btn btn-light"><i class="fa fa-arrow-left"></i> Kembali</a>
                <button type="reset" class="btn btn-danger"><i class="fa fa-sync"></i> Reset</button>
                <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Simpan</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
<?php $this->load->view('pelanggan-page/template/footer');?>