# Two B70 Use Cases

Two Intel Arc Pro B70 cards provide a lot of local compute and 32 GB of VRAM per card, but they are not automatically one 64 GB GPU. Multi-GPU behavior depends on the framework and communication path.

## Best First Use Cases

### 1. Two Independent GPU Services

This is usually the most reliable setup.

Examples:

- one model server per GPU
- one production server and one experiment server
- one LLM and one embedding server
- one LLM and one video, vision, Whisper, or OpenVINO pipeline

Benefits:

- easier debugging
- fewer multi-GPU communication failures
- clear resource isolation
- no tensor-parallel correctness assumptions

### 2. Tensor Parallel Inference

Use this when the framework supports XPU communication for your model.

Candidate paths:

- vLLM XPU backend
- PyTorch XPU with oneCCL/XCCL
- llama.cpp SYCL tensor split
- OpenVINO or OpenVINO GenAI paths that support the target model

What to measure:

- does it load
- does it generate correct output
- is throughput better than one GPU
- does longer context still fit
- do repeat runs stay stable

### 3. Capacity Split

For models that barely fit on one card, a second GPU may help by splitting layers, pipeline stages, or services. Expect lower scaling than pure compute workloads.

### 4. Development And Benchmark Lab

Two cards are excellent for controlled comparisons:

- driver A/B tests
- framework version comparisons
- one GPU as stable baseline, one GPU as experimental target
- patch validation
- thermal and power comparison

## What Is Less Certain

- transparent 64 GB memory pooling
- automatic multi-GPU scaling
- training large models without framework-specific work
- assuming CUDA-oriented tuning maps directly to XPU

## What To Post When Asking For Advice

- motherboard and slot layout
- CPU and RAM
- power supply and connector layout
- OS, kernel, driver version
- intended models and quantization
- whether you care more about max throughput, reliability, context length, or experimentation
