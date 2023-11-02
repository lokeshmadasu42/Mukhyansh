## Training & Evaluation

```bash
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

```
Arguments:
- `vocab_csv`: 
- `train_file` :
