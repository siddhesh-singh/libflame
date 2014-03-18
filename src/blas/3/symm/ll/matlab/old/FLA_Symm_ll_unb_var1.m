function [ X ] = Symm_ll_unb_var1( alpha, A, B, C )
%
% Invariant: [ CT,...
%              CB, ] = [ hatCT+alpha*ATL*BT,...
%                        hatCB ]
%
  [ ATL, ATR,...
    ABL, ABR     ] = FLA_Part_2x2( A,...
                                   0, 0, 'FLA_TL' );
  [ BT,...
    BB ] = FLA_Part_2x1( B,...
                         0, 'FLA_TOP' );
  [ CT,...
    CB ] = FLA_Part_2x1( C,...
                         0, 'FLA_TOP' );

  while( size( CT, 1 ) ~= size( C, 1 ) )
    [ A00,  a01,     A02,...
      a10t, alpha11, a12t,...
      A20,  a21,     A22      ] = FLA_Repart_2x2_to_3x3( ATL, ATR,...
                                                         ABL, ABR,...
                                                         1, 1, 'FLA_BR' );
    [ B0,...
      b1t,...
      B2 ] = FLA_Repart_2x1_to_3x1( BT,...
                                    BB, 1, 'FLA_BOTTOM' );
    [ C0,...
      c1t,...
      C2 ] = FLA_Repart_2x1_to_3x1( CT,...
                                    CB, 1, 'FLA_BOTTOM' );
%* ********************************************************************** *%
    C0  = C0 + alpha * a10t' * b1t;
    c1t = alpha * a10t * B0  + c1t;
    c1t = alpha * alpha11 * b1t + c1t;
%* ********************************************************************** *%
    [ ATL, ATR,...
      ABL, ABR     ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,...
                                                 a10t, alpha11, a12t,...
                                                 A20,  a21,     A22,...
                                                 'FLA_TL' );
    [ BT,...
      BB ] = FLA_Cont_with_3x1_to_2x1( B0,...
                                       b1t,...
                                       B2, 'FLA_TOP' );
    [ CT,...
      CB ] = FLA_Cont_with_3x1_to_2x1( C0,...
                                       c1t,...
                                       C2, 'FLA_TOP' );

  end

  X = CT;
  return;