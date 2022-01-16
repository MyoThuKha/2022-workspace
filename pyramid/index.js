let star_row ="";
const num_row = 8;
for (let i=1;i <= num_row; i++){
    for (let j=0; j < (num_row-i); j++){
        star_row = star_row + " ";
    }
    for (let k =0;k < i; k++){
        star_row += "* ";
    }
    console.log(star_row);
    star_row = "";
}
