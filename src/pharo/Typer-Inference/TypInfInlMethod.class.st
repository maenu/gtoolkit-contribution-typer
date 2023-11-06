Class {
	#name : #TypInfInlMethod,
	#superclass : #TypInfMethod,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlMethod >> transfer [
	| lookup |
	lookup := self lookup .
	(lookup resolver isKindOf: TypInfMethodResolver)
		ifFalse: [ lookup arguments
				withIndexDo: [ :t :i | self constrain: (self inArgumentAt: i) to: t ].
			in
				at: #return
				ifPresent: [ :s | s do: [ :e | self constrain: e origin to: lookup result ] ] ].
	super transfer
]
