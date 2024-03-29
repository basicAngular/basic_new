<?php
namespace App\Repository;

use App\Repository\RepositoryInterface;
use App\User;

class UserRepository implements RepositoryInterface
{
    private $model;

    public function __construct(User $User)
    {
        $this->model = $User;
    }

    public function createUpdateData($condition, $parameters)
    {
        return $resultSet = $this->model->updateOrCreate($condition, $parameters);
    }

    public function getData($conditions, $method, $withArr = [])
    { 
        $query = $this->model->query();
        if ($conditions)
        {
            $query->where($conditions);
        }

        if (!empty($withArr))
        {
            $query->with($withArr);
        }

        $resultSet = $query->orderBy('created_at', 'desc')->$method();

        if (!empty($resultSet))
        {
            $resultSet = $resultSet->toArray();
        }

        return $resultSet;
    }

    public function getCount($conditions)
    {
        $query = $this->model->query();

        if (!empty($conditions))
        {
            $query->where($conditions);
        }

        return $count = $query->count();
    }

    public function getValue($conditions, $field)
    {
        # code...
        $query = $this->model->query();

        if (!empty($conditions))
        {
            $query->where($conditions);
        }

        return $value = $query->value($field);
    }

    public function pluckValue($conditions, $field)
    {
        $query = $this->model->query();

        if (!empty($conditions))
        {
            $query->where($conditions);
        }

        return $value = $query->value($field);
    }
}
