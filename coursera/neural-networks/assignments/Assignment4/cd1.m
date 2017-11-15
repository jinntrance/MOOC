function ret = cd1(rbm_w, visible_data)
% <rbm_w> is a matrix of size <number of hidden units> by <number of visible units>
% <visible_data> is a (possibly but not necessarily binary) matrix of size <number of visible units> by <number of data cases>
% The returned value is the gradient approximation produced by CD-1. It's of the same shape as <rbm_w>.
    %error('not yet implemented');
    visible_data = sample_bernoulli(visible_data);
    h0_prob = visible_state_to_hidden_probabilities(rbm_w, visible_data);
    hidden0 = sample_bernoulli(h0_prob);
    recon_visible_prob = hidden_state_to_visible_probabilities(rbm_w, hidden0);
    recon_visible = sample_bernoulli(recon_visible_prob);
    h1_prob = visible_state_to_hidden_probabilities(rbm_w, recon_visible);
    %h1_prob = sample_bernoulli(h1_prob);

    data_goodness = configuration_goodness_gradient(visible_data, hidden0);

    recon_goodness = configuration_goodness_gradient(recon_visible, h1_prob);

    ret = data_goodness - recon_goodness;
    return;
end
