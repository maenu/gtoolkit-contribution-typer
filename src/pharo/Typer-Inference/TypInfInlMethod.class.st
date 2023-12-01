Class {
	#name : #TypInfInlMethod,
	#superclass : #TypInfMethod,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlMethod >> transfer [
	lookup := nil.
	lookup := self lookup.
	(lookup resolver isKindOf: TypInfMethodResolver)
		ifFalse: [ | result |
			result := lookup result.
			result arguments
				withIndexDo: [ :t :i | self constrain: (self inArgumentAt: i) to: t ].
			in
				at: #return
				ifPresent: [ :s | s do: [ :e | self constrain: e origin to: result result ] ] ].
	super transfer
]
