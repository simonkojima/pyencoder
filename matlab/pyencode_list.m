function encoded_str =  pyencode_list(cell, varargin)
    % 
    % ver 0.0.1
    %
    % e.g.,  cell = {{1,2,{3,4},5}, {6,7,8}}
    % 

    if isempty(varargin)
        level_parent = "";
    else
        level_parent = varargin{1};
    end
    
    encoded_str = "";
    level_cnt = 0;
    for m = 1:length(cell)
        if iscell(cell{m})
            level_cnt = level_cnt + 1;
            val = strcat("%list", level_parent, "_", num2str(level_cnt), ";");
            val = strcat(val, pyencode_list(cell{m}, strcat(level_parent, "_", num2str(level_cnt))));
            val = strcat(val, "%list", level_parent, "_", num2str(level_cnt), ";");
        elseif isstring(cell{m}) || ischar(cell{m})
            val = strcat("%str;", cell{m}, ";");
        elseif floor(cell{m}) == cell{m} % is int
            val = strcat("%int;", num2str(cell{m}), ";");
        elseif floor(cell{m}) ~= cell{m} % is float
            val = strcat("%float;", num2str(cell{m}), ";");
        else
            error("Encode Error, Unknown type");
        end
        encoded_str = strcat(encoded_str, val);
        char(encoded_str);
    end
end