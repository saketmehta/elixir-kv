defmodule KV.Bucket do
    @doc """
    Starts a new bucket.
    """
    def start_link do
        Agent.start_link fn -> %{} end
    end

    @doc """
    Gets a value from the `bucket` by `key`.
    """
    def get bucket, key do
        Agent.get(bucket, fn map -> Map.get(map, key) end)
    end

    @doc """
    Puts the value for given `key` into the `bucket`.
    """
    def put bucket, key, value do
        Agent.update(bucket, fn map -> Map.put(map, key, value) end)
    end

    @doc """
    Deletes the value for the given `key` from `bucket.

    Returns the value if it exists.
    """
    def delete bucket, key do
        Agent.get_and_update(bucket, fn map -> Map.pop(map, key) end)
    end
end