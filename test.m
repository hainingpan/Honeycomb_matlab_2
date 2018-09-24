function linindex=test(kindex,b)
q=5;

        kxindex=ceil(kindex/q);
        kyindex=mod((kindex-1),q)+1;
        switch b
            case 1
                kxbindex=kxindex;
                kybindex=mod(kyindex,q)+1;
            case 2
                kxbindex=mod(kxindex,q)+1;
                kybindex=mod(kyindex,q)+1;
            case 3
                kxbindex=mod(kxindex,q)+1;
                kybindex=kyindex;
            case 4
                kxbindex=kxindex;
                kybindex=mod(kyindex-2,q)+1;
            case 5
                kxbindex=mod(kxindex-2,q)+1;
                kybindex=mod(kyindex-2,q)+1;
            case 6
                kxbindex=mod(kxindex-2,q)+1;
                kybindex=kyindex;
        end
        linindex=(kxbindex-1)*q+kybindex;
     
end