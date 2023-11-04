Class {
	#name : #TypInfInlMethod,
	#superclass : #TypInfMethod,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlMethod >> transfer [
	| lookup |
	lookup := self lookup preResolve.
	(lookup resolver isKindOf: TypInfMethodResolver)
		ifFalse: [ | resolved |
			resolved := self lookup resolve.
			resolved arguments
				withIndexDo: [ :t :i | self constrain: (self inArgumentAt: i) to: t ].
			in
				at: #return
				ifPresent: [ :s | s do: [ :e | self constrain: e origin to: resolved result ] ] ].
	super transfer
]
