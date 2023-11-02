#!/bin/bash
#SBATCH -A research 
#SBATCH -c 30
#SBATCH --gres gpu:4
#SBATCH --mem-per-cpu 2G
#SBATCH --time 1-00:00:00
#SBATCH --output kannada_bpe.logs
#SBATCH --mail-user lokesh.madasu@research.iiit.ac.in
#SBATCH --mail-type ALL
#SBATCH --job-name HG_kannada_bpe

module load u18/cuda/10.2

source /home2/lokesh.madasu/miniconda3/etc/profile.d/conda.sh

conda deactivate
echo "conda activate cs2"
conda activate cs2

echo "available cuda devices: "
echo "$CUDA_VISIBLE_DEVICES"

echo "exporting cuda device order"
export CUDA_DEVICE_ORDER="PCI_BUS_ID"

echo "exporting cuda devices numbers"
export CUDA_VISIBLE_DEVICES="0,1,2,3"

echo "training"
python3 seq2seq.py \
    --vocab_csv data/kannada_bpe_vocab.csv \
    --train_file data/kannada_train.jsonl \
    --dev_file data/kannada_dev.jsonl \
    --test_file data/kannada_test.jsonl \
    --model_weights model_weights_9.h5 \
    --test_outputs_file test_prediction.txt \
    --use_bpe True \
    --bpe_lang_code 'kn' \
    --bpe_vocab_size 50000 \
    --language 'kannada' \
    --do_train True \
    --do_test True \
    --train_batch_size 32 \
    --val_batch_size 16 \
    --test_batch_size 1 \
    --epochs 1 \
    --rnn_type 'gru' \
    --max_input_length 150 \
    --max_target_length 30 \
    --beam_size 5 \
    --beamsearch_length_penalty 0.1

echo "deactivate cs2"
conda deactivate
