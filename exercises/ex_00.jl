abstract type Object{K} end

struct MyVector{K} <: Object{K}
    data::Vector{K}
end

struct MyMatrix{K} <: Object{K}
    data::Matrix{K}
end


function add!(self::T, v::T) where T <: Object
    self.data .+= v.data
    return self
end

function sub!(self::T, v::T) where T <: Object
    self.data .-= v.data
    return self
end

function scl!(self::T, v::Number) where T <: Object
    self.data .*= v
    return self
end

u = MyVector{Float32}([2.0, 3.0])
v = MyVector{Float32}([5.0, 7.0])
println(add!(u, v))

u = MyVector{Float32}([2.0, 3.0])
v = MyVector{Float32}([5.0, 7.0])
println(sub!(u, v))

u = MyVector{Float32}([2.0, 3.0])
println(scl!(u, 2.0))


u = MyMatrix{Float32}([1.0 2.0; 3.0 4.0])
v = MyMatrix{Float32}([7.0 4.0; -2.0 2.0])
println(add!(u, v))

u = MyMatrix{Float32}([1.0 2.0; 3.0 4.0])
v = MyMatrix{Float32}([7.0 4.0; -2.0 2.0])
println(sub!(u, v))

u = MyMatrix{Float32}([1.0 2.0; 3.0 4.0])
println(scl!(u, 2))
