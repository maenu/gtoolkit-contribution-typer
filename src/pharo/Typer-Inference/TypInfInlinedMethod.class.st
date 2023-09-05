Class {
	#name : #TypInfInlinedMethod,
	#superclass : #TypInfMethod,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlinedMethod >> arguments [
	^ self inArguments
		collect: [ :e | state at: e ifAbsent: TypUnknownType instance ]
]

{ #category : #accessing }
TypInfInlinedMethod >> lookup [
	^ TypMethodLookup
		receiver: context self
		selector: node selector
		arguments: self arguments
		self: context self
		super: context super
		parent: nil
]

{ #category : #accessing }
TypInfInlinedMethod >> transfer [
	self lookup preResolve
		reject: [ :l | l resolver isKindOf: TypInfMethodResolver ]
		thenDo: [ :l | 
			| resolved |
			resolved := l resolve.
			resolved arguments
				withIndexDo: [ :t :i | self constrain: (self inArgumentAt: i) to: t ].
			self inReturns do: [ :n | self constrain: n to: resolved result ] ].
	super transfer
]
