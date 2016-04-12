<script type="text/javascript">
    totalProducts = parseInt('<?php if(isset($totalProducts)){ echo $totalProducts; } ?>');
    function createObjSlider(minCost, maxCost, defMin, defMax, curMin, curMax, lS, rS){
        this.minCost = minCost;
        this.maxCost = maxCost;
        this.defMin = defMin;
        this.defMax = defMax;
        this.curMin = curMin;
        this.curMax = curMax;
        this.lS = lS;
        this.rS = rS;
    };
    sliders = new Object();
    sliders.slider1 = new createObjSlider('.minCost', '.maxCost', <?php if(isset($minPrice)){ echo $minPrice; } ?>, <?php if(isset($maxPrice)){ echo $maxPrice; } ?>, <?php if(isset($curMin)){ echo $curMin; } ?>, <?php if(isset($curMax)){ echo $curMax; } ?>, 'lp', 'rp');
</script><?php $mabilis_ttl=1460566825; $mabilis_last_modified=1390385002; ///home/u14026/public_html/inpromservice.com.ua/templates/newLevel/smart_filter/filter_opt.tpl ?>