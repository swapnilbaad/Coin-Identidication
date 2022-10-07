function [cropped_coins_imgs, C] = geometry_estim(img, h_px_2_mm, v_px_2_mm)
    diameters =  coins_diameters();
    radii_px = (diameters*((h_px_2_mm+v_px_2_mm)./2))./(2);
    [sorted_radii_px, ~] = sort(radii_px);
    difference = zeros(1,length(diameters)+1); 
    difference(2:end-1)=diff(sorted_radii_px);
    difference(1) = difference(2);
    difference(end) = difference(end-1);
    
    min_bound = floor(sorted_radii_px(1)-(difference(1)/2));
    max_bound = ceil(sorted_radii_px(end)+(difference(end)/1.2));
    
    [centers, radii] = coins_detection(img, min_bound, max_bound, false);
    cropped_coins_imgs = coins_cropping(img, centers, radii);
   
%     imshowpair(img,cell2mat(cropped_coins_imgs(1)),'montage')
    C = zeros(length(radii),6);
    
    for i = 1:length(cropped_coins_imgs)
            img = cell2mat(cropped_coins_imgs(i));
            try
                radii(i) = eliminate_shadow(img, radii(i), min_bound, max_bound);
            catch ME
                warning('Couldnt eliminate shadow, geometric estimation might be inaccurate')
            end
    end
    for idx = 1:length(radii)
        for coin = 1:6
            C(idx,coin) = log(normpdf(radii(idx),radii_px(coin)));
        end
    end
end