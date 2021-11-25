<div class="dropdown dropup">
  <a class="dropdown-toggle px-3" type="button" id="{$product.id_product}" data-bs-toggle="dropdown" aria-expanded="false">
    <i class="fas fa-ellipsis-v"></i>
  </a>

 <div class="dropdown-menu dropdown-catalog row" aria-labelledby="{$product.id_product}">
  <div class="col-12">

   {block name='product_description_short'}
    <div id="product-description-short-{$product.id}">
      <div itemprop="description">{$product.description_short nofilter}</div>
  	</div>
   {/block}

   {block name='product-manufacturer'}
		 {if $product.id_manufacturer}
		  <div class="product-manufacturer">
		   {l s='Brand' d='Shop.Theme.Catalog'}: 
		     <span>{Manufacturer::getNameById($product.id_manufacturer)}</span>
		  </div>
		  {/if}
   {/block}

   {block name='product_reference'}
    {if isset($product.reference_to_display) && $product.reference_to_display neq ''}
      <div class="product-reference">
        <label>{l s='Reference' d='Shop.Theme.Catalog'}: </label>
        <span itemprop="sku">{$product.reference_to_display}</span>
      </div>
    {/if}
   {/block}

   {block name='product_quantities'}
    {if $product.show_quantities}
      <div class="product-quantities">
        <label class="label">{l s='In stock' d='Shop.Theme.Catalog'}: </label>
        <span data-stock="{$product.quantity}" data-allow-oosp="{$product.allow_oosp}">{$product.quantity} {$product.quantity_label}</span>
      </div>
    {/if}
   {/block}

   {block name='product_availability_date'}
    {if $product.availability_date}
      <div class="product-availability-date">
        <label>{l s='Availability date:' d='Shop.Theme.Catalog'}: </label>
        <span>{$product.availability_date}</span>
      </div>
    {/if}
   {/block}

   {block name='product_out_of_stock'}
    <div class="product-out-of-stock">
      {hook h='actionProductOutOfStock' product=$product}
    </div>
   {/block}

   {block name='product_features'}
    {if $product.grouped_features}
      <div class="product-features">
          {foreach from=$product.grouped_features item=feature}
		  <div>
            <label>{$feature.name}: </label>
            <span>{$feature.value|escape:'htmlall'|nl2br nofilter}</span>
			</div>
          {/foreach}
      </div>
    {/if}
   {/block}

   {* if product have specific references, a table will be added to product details section *}
   {block name='product_specific_references'}
    {if !empty($product.specific_references)}
      <div class="product-features">
            {foreach from=$product.specific_references item=reference key=key}
			<div>
              <label>{$key}: </label>
              <span>{$reference}</span>
			  </div>
            {/foreach}
      </div>
    {/if}
   {/block}

   {block name='product_condition'}
    {if $product.condition}
      <div class="product-condition">
        <label>{l s='Condition' d='Shop.Theme.Catalog'}: </label>
        <link itemprop="itemCondition" href="{$product.condition.schema_url}"/>
        <span>{$product.condition.label}</span>
      </div>
    {/if}
   {/block}
  
   {block name='product_variants'}
    {if $product.main_variants}
      <div class="product-color row">
           <span class="col-md-auto col-form-label col-form-label-sm">{l s='Color:' d='Shop.Theme.Catalog'}</span> {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
	  </div>
    {/if}
   {/block}
  
   </div>
  </div>
</div>
