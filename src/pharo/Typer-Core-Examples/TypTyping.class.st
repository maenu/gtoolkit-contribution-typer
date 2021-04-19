Class {
	#name : #TypTyping,
	#superclass : #Object,
	#category : #'Typer-Core-Examples'
}

{ #category : #accessing }
TypTyping >> typeMethods [
	<gtExample>
	| methods results |
	results := OrderedCollection new.
	methods := CompiledMethod allInstances.
	1 to: 10 do: [ :i | 
		| method |
		method := methods atRandom.
		results add: (method typInfTypeIn: method methodClass typAsType) ].
	^ results
]
