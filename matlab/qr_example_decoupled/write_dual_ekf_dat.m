%==========================================================================
% Write to dual_ekf.dat in a binary format.  Note that the transposes/order of
% the variables is important to compensate for the row-major/column-major
% differences in array storage between Matlab, C++, and Fortran
%==========================================================================
function write_dual_ekf_dat(fname_dat, ...
    A, ...
    B, ...
    P2_0, ...
    P3_0, ...
    P3_lambda, ...
    XI, ...
    Cekf, ...
    Kekf, ...
    k, ...
    beta_min, ...
    beta_max)

disp(['Writing to ' fname_dat '...']);

fid = fopen(fname_dat, 'w');

fwrite(fid, A', 'double');
fwrite(fid, B', 'double');
fwrite(fid, P2_0', 'double');
fwrite(fid, P3_0', 'double');
fwrite(fid, P3_lambda', 'double');
fwrite(fid, XI', 'double');
fwrite(fid, Cekf', 'double');
fwrite(fid, Kekf', 'double');
fwrite(fid, k, 'double');
fwrite(fid, beta_min, 'double');
fwrite(fid, beta_max, 'double');

fclose(fid);
