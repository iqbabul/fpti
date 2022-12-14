  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="<?=base_url();?>assets/private/admin/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><?=$user->fullname;?></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">MENU</li>
        <li>
          <a href="<?=base_url('admin/dashboard')?>">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
          </a>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-folder"></i>
            <span>Data Pengguna</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="<?=base_url('admin/user/akses')?>"><i class="fa fa-circle-o"></i> Hak Akses</a></li>
            <?php foreach($akses as $rul): ?>
            <li><a href="<?=base_url()?>admin/user/data/<?=$rul->alias?>"><i class="fa fa-circle-o"></i> <?=$rul->nama_akses?></a></li>
            <?php endforeach ?>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-gear"></i>
            <span>Pengaturan</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="<?=base_url('admin/dashboard')?>"><i class="fa fa-circle-o"></i> Data Kompetisi</a></li>
            <li><a href="<?=base_url('admin/dashboard')?>"><i class="fa fa-circle-o"></i> Nomor Kompetisi</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-industry"></i>
            <span>Kompetisi</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="<?=base_url('admin/dashboard')?>"><i class="fa fa-circle-o"></i> Hasil</a></li>
            <li><a href="<?=base_url('admin/dashboard')?>"><i class="fa fa-circle-o"></i> Dokumentasi</a></li>
          </ul>
        </li>
        <li>
            <a href="<?=base_url('admin/dashboard')?>">
            <i class="fa fa-check"></i> <span>Approval Atlet</span>
            <small class="label pull-right bg-green">20</small>
          </a>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
