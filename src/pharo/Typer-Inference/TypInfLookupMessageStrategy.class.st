Class {
	#name : #TypInfLookupMessageStrategy,
	#superclass : #TypInfMessageStrategy,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfLookupMessageStrategy >> apply [
	| method |
	method := message receiver
			lookupMethod: message selector asSymbol
			arguments: message arguments.
	message arguments
		withIndexDo: [ :e :i | 
			i <= method arguments size
				ifTrue: [ message state at: e put: (method arguments at: i) ] ]
]

{ #category : #accessing }
TypInfLookupMessageStrategy >> canApply [
	^ true
]

{ #category : #accessing }
TypInfLookupMessageStrategy >> revert [
	"noop"

	
]
