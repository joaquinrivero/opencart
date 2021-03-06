<?php echo $header; ?>
<div id="content">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-error"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <div class="tabbable tabs-left">
        <ul class="nav nav-tabs" id="country">
          <?php foreach ($countries as $country) { ?>
          <li><a href="#tab-<?php echo $country['code']; ?>" data-toggle="tab"><?php echo $country['name']; ?></a></li>
          <?php } ?>
        </ul>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
          <div class="tab-content">
            <?php foreach ($countries as $country) { ?>
            <div class="tab-pane" id="tab-<?php echo $country['code']; ?>">
              <table class="form">
                <tr>
                  <td><?php echo $entry_total ?></td>
                  <td><input type="text" name="klarna_fee[<?php echo $country['code']; ?>][total]" value="<?php echo isset($klarna_fee[$country['code']]) ? $klarna_fee[$country['code']]['total'] : ''; ?>" /></td>
                </tr>
                <tr>
                  <td><?php echo $entry_fee ?></td>
                  <td><input type="text" name="klarna_fee[<?php echo $country['code']; ?>][fee]" value="<?php echo isset($klarna_fee[$country['code']]) ? $klarna_fee[$country['code']]['fee'] : ''; ?>" /></td>
                </tr>
                <tr>
                  <td><?php echo $entry_tax_class; ?></td>
                  <td><select name="klarna_fee[<?php echo $country['code']; ?>][tax_class_id]">
                      <option value="0"><?php echo $text_none; ?></option>
                      <?php foreach ($tax_classes as $tax_class) { ?>
                      <?php if (isset($klarna_fee[$country['code']]) && $klarna_fee[$country['code']]['tax_class_id'] == $tax_class['tax_class_id']) { ?>
                      <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select></td>
                </tr>
                <tr>
                  <td><?php echo $entry_status; ?></td>
                  <td><select name="klarna_fee[<?php echo $country['code']; ?>][status]">
                      <?php if (isset($klarna_fee[$country['code']]) && $klarna_fee[$country['code']]['status']) { ?>
                      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                      <option value="0"><?php echo $text_disabled; ?></option>
                      <?php } else { ?>
                      <option value="1"><?php echo $text_enabled; ?></option>
                      <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                      <?php } ?>
                    </select></td>
                </tr>
                <tr>
                  <td><?php echo $entry_sort_order ?></td>
                  <td><input type="text" name="klarna_fee[<?php echo $country['code']; ?>][sort_order]" value="<?php echo isset($klarna_fee[$country['code']]) ? $klarna_fee[$country['code']]['sort_order'] : ''; ?>" /></td>
                </tr>
              </table>
            </div>
            <?php } ?>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#country a:first').tab('show');
//--></script> 
<?php echo $footer; ?> 