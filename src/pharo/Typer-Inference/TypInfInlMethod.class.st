Class {
	#name : #TypInfInlMethod,
	#superclass : #TypInfMethod,
	#category : #'Typer-Inference-Inline'
}

{ #category : #accessing }
TypInfInlMethod >> arguments [
	^ self inArguments
		collect: [ :e | state at: e ifAbsent: TypUnknownType instance ]
]

{ #category : #accessing }
TypInfInlMethod >> lookup [
	^ TypMethodLookup
		receiver: context self
		selector: node selector
		arguments: self arguments
		self: context self
		super: context super
		parent: nil
]

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
