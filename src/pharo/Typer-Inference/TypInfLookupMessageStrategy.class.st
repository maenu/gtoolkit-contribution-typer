Class {
	#name : #TypInfLookupMessageStrategy,
	#superclass : #TypInfMessageStrategy,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfLookupMessageStrategy >> canInstall [
	^ true
]

{ #category : #accessing }
TypInfLookupMessageStrategy >> install [
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
TypInfLookupMessageStrategy >> uninstall [
	"noop"

	
]
