nhidden = 2;
ninput = 3;
noutput = 4;

W.hidden = rand(ninput + 1, nhidden);
W.output = rand(nhidden, noutput);

X = [randn(100,ninput),ones(100,1)];
Y = randn(100,noutput);

output = transfer((X * W.hidden) * W.output, 'linear');
[err, derr] = error_function(Y, output, 'sumsquared');

(err .* derr) * W.output'
