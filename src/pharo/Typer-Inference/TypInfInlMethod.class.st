Class {
	#name : #TypInfInlMethod,
	#superclass : #TypInfMethod,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlMethod >> transfer [
	self lookup preResolve
		reject: [ :l | l resolver isKindOf: TypInfMethodResolver ]
		thenDo: [ :l | 
			| resolved |
			resolved := l resolve.
			resolved arguments
				withIndexDo: [ :t :i | self constrain: (self inArgumentAt: i) to: t ].
			in
				at: #return
				ifPresent: [ :s | s do: [ :e | self constrain: e origin to: resolved result ] ] ].
	super transfer
]
