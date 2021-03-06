/*

    Copyright (C) 2014, The University of Texas at Austin

    This file is part of libflame and is available under the 3-Clause
    BSD license, which can be found in the LICENSE file at the top-level
    directory, or at http://opensource.org/licenses/BSD-3-Clause

*/

#include "FLAME.h"

FLA_Error FLA_Obj_ge_check( FLA_Obj A, FLA_Obj B )
{
  FLA_Error e_val;

  e_val = FLA_Check_comparable_object( A );
  FLA_Check_error_code( e_val );

  e_val = FLA_Check_consistent_object_datatype( A, B );
  FLA_Check_error_code( e_val );

  e_val = FLA_Check_if_scalar( A );
  FLA_Check_error_code( e_val );

  e_val = FLA_Check_if_scalar( B );
  FLA_Check_error_code( e_val );

  return FLA_SUCCESS;
}

