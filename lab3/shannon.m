function shannon_image()
    %  Read image 
    img = imread('peppers.png');     
    img_gray = rgb2gray(img);
    figure, imshow(img_gray), title('Original Image');

    pixels = img_gray(:);

    % Frequency table
    symbols = unique(pixels);
    freq = histc(pixels, symbols);
    prob = freq / sum(freq);

    %   Shannon–Fano coding 
    sf_codes = shannon_fano(symbols, prob);

    %  Encode the image 
    sf_encoded = '';
    for i = 1:length(pixels)
        sf_encoded = [sf_encoded sf_codes{pixels(i)+1}];
    end

    %  Sizes 
    orig_size = numel(pixels) * 8;      
    sf_size = length(sf_encoded);

    fprintf('\n--- Shannon–Fano Encoding ---\n');
    fprintf('Original Size : %d bits (%.2f KB)\n', orig_size, orig_size/8/1024);
    fprintf('Shannon–Fano Encoded Size : %d bits (%.2f KB)\n', sf_size, sf_size/8/1024);
end


%% Shannon–Fano 
function codes = shannon_fano(symbols, prob)
    [prob, idx] = sort(prob, 'descend');
    symbols = symbols(idx);
    codes = cell(1, 256); % store codes for all gray values
    
    recurse(symbols, prob, '');
    
    function recurse(sym, pr, prefix)
        if numel(sym) == 1
            codes{sym+1} = prefix;
            return;
        end
        total = sum(pr);
        cum = cumsum(pr);
        split = find(cum >= total/2, 1);
        recurse(sym(1:split), pr(1:split), [prefix '0']);
        recurse(sym(split+1:end), pr(split+1:end), [prefix '1']);
    end
end

