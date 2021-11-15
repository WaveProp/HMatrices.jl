module HMatrices

const PROJECT_ROOT =  pkgdir(HMatrices)

using StaticArrays
using LinearAlgebra
using Statistics:median
using TimerOutputs
using Printf
using RecipesBase
using Distributed
using Base.Threads

using WavePropBase
using WavePropBase.Trees
using WavePropBase.Utils
using WavePropBase.Geometry

import AbstractTrees
import LinearAlgebra: mul!, lu!, lu, LU, ldiv!, rdiv!, axpy!, rank, rmul!, lmul!
import Base: Matrix, adjoint

"""
    const ALLOW_GETINDEX

If set to false, the `getindex(H,i,j)` method will throw an error on
`AbstractHMatrix`.
"""
const ALLOW_GETINDEX = Ref(true)

include("utils.jl")
include("kernelmatrix.jl")
include("rkmatrix.jl")
include("compressor.jl")
include("hmatrix.jl")
include("dhmatrix.jl")
include("addition.jl")
include("multiplication.jl")
include("triangular.jl")
include("lu.jl")

export Utils,
    Geometry,
    Trees,
    # types (re-exported)
    ClusterTree,
    CardinalitySplitter,
    DyadicSplitter,
    GeometricSplitter,
    GeometricMinimalSplitter,
    HyperRectangle,
    # abstract types
    AbstractKernelMatrix,
    # types
    HMatrix,
    KernelMatrix,
    StrongAdmissibilityStd,
    WeakAdmissibilityStd,
    PartialACA,
    ACA,
    TSVD,
    # functions
    compression_ratio,
    print_tree,
    assemble_hmat,
    # macros
    @hprofile

end