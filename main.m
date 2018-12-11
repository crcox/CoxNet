% Learning Rate
% eta = 0.0001;
% % Linear Example
% nhidden = 2;
% ninput = 3;
% noutput = 4;
% 
% W.hidden_true = rand(ninput + 1, nhidden);
% W.hidden = rand(ninput + 1, nhidden);
% W.output_true = rand(nhidden, noutput);
% W.output = rand(nhidden, noutput);
% 
% X = [randn(100,ninput),ones(100,1)];
% Y = transfer(transfer((X * W.hidden_true), 'linear') * W.output_true, 'linear');

% % XOR
eta = 0.005;
nhidden = 2;
ninput = 2;
noutput = 1;

W.hidden = rand(ninput + 1, nhidden)*0.3;
W.output = rand(nhidden, noutput)*0.3;

X = [0,0,1; 0,1,1; 1,0,1; 1,1,1];
Y = [0;1;1;0];

% _z is linear sum (no transfer function)
niter = 10000;
report_each = 1000;
errhist = zeros(niter,1);
fprintf(' %12s %12s\n', 'iteration', 'mean sq. err.');
fprintf('---------------------------\n');
for iter = 1:1
    A.hidden_z = (X * W.hidden);
    [A.hidden, A.hidden_dydz] = transfer(A.hidden_z, 'sigmoid');
    A.output_z = (A.hidden * W.output);
    [A.output, A.output_dydz] = transfer(A.output_z, 'sigmoid');

    [err, derr] = error_function(Y, A.output, 'crossentropy');
    if mod(iter, report_each) == 0
        fprintf('% 12d: %12.8f\n', iter, mean(sum(err,2)));
    end
    errhist(iter) = mean(sum(err,2));

    A.output_delta = (derr .* A.output_dydz);
    W.output_dJdW = zeros(size(W.output));
    for i = 1:noutput
        W.output_dJdW(:,i) = bsxfun(@times, A.hidden, W.output(:,i)')' * A.output_delta(:,i);
    end

    A.hidden_delta = (A.output_delta * W.output') .* A.hidden_dydz;
    W.hidden_dJdW = zeros(size(W.hidden));
    for i = 1:nhidden
        W.hidden_dJdW(:,i) = X' * A.hidden_delta(:,i);
    end
    W.hidden = W.hidden - (W.hidden_dJdW .* eta);
    W.output = W.output - (W.output_dJdW .* eta);
end
plot(errhist);
