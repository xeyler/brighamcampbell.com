// install flint before compiling
// gcc flint-calc-collision-likelihood.c -lflint

#include <flint/arb.h>
#include <flint/fmpz.h>
#include <flint/fmpq.h>
#include <stdio.h>
#include <stdlib.h>

void birthday_p(fmpz_t d, unsigned long n, arb_t *p) {
	fmpz_t numerator, denominator, rfac_lower;
	fmpq_t frac;

	if (fmpz_cmp_ui(d, n) < 0) {
		// By the pigeonhole principle, p = 1
		arb_set_ui(*p, 1);
		return;
	}

	fmpz_init(numerator);
	fmpz_init(denominator);
	fmpz_init(rfac_lower);

	fmpz_pow_ui(denominator, d, n);

	fmpz_sub_ui(rfac_lower, d, n + 1);
	fmpz_rfac_ui(numerator, rfac_lower, n);
	fmpz_neg(numerator, numerator);

	fmpq_init(frac);

	fmpq_set_fmpz_frac(frac, numerator, denominator);
	fmpq_add_ui(frac, frac, 1);

	arb_set_fmpq(*p, frac, 128);
}

int main(int argc, char **argv) {
	fmpz_t abbrev_domain;
	arb_t p;
	const unsigned long ABBREV_LENGTH = strtoul(argv[1], NULL, 10);
	const unsigned long NUM_COMMITS = strtoul(argv[2], NULL, 10);

	if (argc != 3) {
		printf("Usage: %s <ABBREV_LENGTH> <NUMBER_OF_COMMITS>\n", argv[0]);
		return 1;
	}

	fmpz_init(abbrev_domain);

	fmpz_one_2exp(abbrev_domain, ABBREV_LENGTH * 4);

	flint_printf("ABBREV_DOMAIN: %{fmpz}\n", abbrev_domain); 
	flint_printf("NUM_COMMITS: %{ulong}\n", NUM_COMMITS);

	arb_init(p);
	birthday_p(abbrev_domain, NUM_COMMITS, &p);

	flint_printf("p = %{arb}\n", p);

	fmpz_clear(abbrev_domain);
	arb_clear(p);
}
