function gendatafile(filename, count)
dmax32 = double(intmax('uint32'));
randData = gallery('uniformdata', [count, 1], 0) * dmax32;

fid = fopen(filename, 'w');
fwrite(fid, randData, 'double'); 
fclose(fid);