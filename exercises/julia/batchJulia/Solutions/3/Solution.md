               ml Julia/1.8.5-linux-x86_64
               ml CUDA/11.4.1
               mkdir ML
               cd ML
               wget https://raw.githubusercontent.com/FluxML/model-zoo/master/vision/vgg_cifar10/vgg_cifar10.jl

               julia
               (v1.8) pkg> activate .
               (ML) pkg> add CUDA
               (ML) pkg> add Flux
               (ML) pkg> add MLDatasets
               (ML) pkg> add MLUtils
               julia> using MLDatasets: CIFAR10
               julia> x, y = CIFAR10(:train)[:]
