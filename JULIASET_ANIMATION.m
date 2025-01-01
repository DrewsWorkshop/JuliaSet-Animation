clc;
clear all;


%FUNCTION CALL
% 2nd Input: Resultion
% 3rd Input: function for different julia set shape

juliaSet(85, 4000,  -0.75*1i, 0, 20);



function juliaSet(r, w, inc, repeatColors,z)

    [X, Y] = meshgrid(linspace(-.75,.75, w)); % Create the grid

    values = X + 1i * Y;

    output = zeros(w, w);

    for i = 1:r
        set(gcf, 'Name', 'JULIA SET ANIMATION')

        values = values.^2 + inc;

        divergent = abs(values) > 10 & output == 0;

        output(divergent) = i;

        if repeatColors == 1
            output = mod(output, r);
        end

        clf;
        imagesc(output); 
        colormap('colorcube'); % Color Theme (personal favorite one)
        
        xlim([i*z (w-i*z)]) % added zoom effect
        ylim([i*z (w-i*z)])
        
        zoom on
        title(['Iteration: ' num2str(i)]); % Display iteration number as title
        drawnow; 
        pause(.1); 
        if i == 1
            pause(15) %slight delay before starting
        end
    
    
    end
   


end





   