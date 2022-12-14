

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <?=$title;?>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-folder"></i> Data Pengguna</a></li>
        <li class="active"><?=$title;?></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-md-12">
            <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">Bordered Table</h3>
            </div>
            <div class="box-body">
                <button class="btn btn-sm btn-success mb-5">Tambah</button><br><br>
                <table class="table table-bordered">
                    <tr>
                        <th style="width: 10px">#</th>
                        <th>Hak Akses</th>
                        <th class="text-center" style="width: 10%" colspan="2">Aksi</th>
                    </tr>
                    <?php $no=1; foreach($akses as $rul): ?>
                    <tr>
                        <td><?=$no++; ?></td>
                        <td><?=$rul->nama_akses;?></td>
                        <td><a href="" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i></a></td>
                        <td><a href="" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></a></td>
                    </tr>
                    <?php endforeach ?>
                </table>
            </div>
      <!-- ./col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

