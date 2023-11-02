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
- `vocab_csv`(file_path) : This is a .csv file, which should contain two columns 1)Index and 2)tokens.it contains top 40k frequent tokens/words in the corpus.  
- `train_file`(file_path) : '.jsonl' file which contains training data with following format. Ex.{'id': 1, 'title': "Title text...", text: "News article text..."}
- `dev_file`(file_path) : Path to '.jsonl' file, which contains validation data.
- `test_file`(file_path, optional) : Path to '.jsonl' file, which contains test data with.
- `model_weights`(checkpoint path) : Path to the 'model_weight.h5' file. If you have already saved a model checkpoint, give that path otherwise give the output path to save the model_weights.h5 file(Ex. './model_weights.h5').
- `test_outputs_file`(file_path, optional) : Path to the output text file(Ex. outputs.txt), which will contain predicted headlines of test news articles.
- `fastText_embeddings_file`(file_path, optional) : Path to the fastText embedding model file. Ex. For Telugu, it will be './cc.te.300.bin'.
- `use_bpe`(bool) : (True/False) Whether to use BPE embeddings or FastText embeddings. If 'True', BPE embeddings will be used.
- `bpe_lang_code`(str, optional) : Specify the language code to load the corresponding bpe embeddings. 
- `bpe_vocab_size`(int, optional) : Specify the bpe vocabulary size. Ex. 1000,5000,10000,50000,100000, etc.
- `language`(str, optional) : Language name argument in multilingual rouge score. Ex. ['telugu','tamil','kannada','malayalam','hindi','bengali','marathi','gujarati']
- `do_train`(bool) : (True/False) Whether to train the model or not.
- `do_test`(bool) : (True/False) Whether to test the model or not.
- `train_batch_size`(int, optional, defaults to 8) : Specify the train batch size. Ex. [4,8,16,etc]
- `val_batch_size`(int, optional, defaults to 8) : Specify the val batch size. Ex. [4,8,16,etc]
- `test_batch_size`(int, optional, defaults to 1) : Specify the test batch size.
- `epochs`(int) : Number of epochs to train the model.
- `rnn_type`(str) : Specify which RNN to use. Ex. `gru` or `lstm`.
- `max_input_length`(int) : Specify the maximum total input sequence length. Sequences longer than this will be truncated, sequences shorter will be padded.
- `max_target_length`(int) : Specify the maximum total sequence length for target text.
- `beam_size`(int, optional) : Number of beams to use for evaluation. This argument will be used during evaluation/prediction.
- `beamsearch_length_penalty`(float, optional) : Specify the length penalty(alpha_value) for beam search.