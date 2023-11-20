Class {
	#name : #TypInfInlMethod,
	#superclass : #TypInfMethod,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlMethod >> transfer [
	| lookup resolved |
	lookup := self lookup.
	lookup canResolve
		ifTrue: [ resolved := lookup resolve.
			(resolved resolver isKindOf: TypInfMethodResolver)
				ifFalse: [ | result |
					result := resolved result.
					result arguments
						withIndexDo: [ :t :i | self constrain: (self inArgumentAt: i) to: t ].
					in
						at: #return
						ifPresent: [ :s | s do: [ :e | self constrain: e origin to: result result ] ] ] ].
	super transfer
]
