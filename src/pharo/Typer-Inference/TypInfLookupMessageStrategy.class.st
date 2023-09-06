Class {
	#name : #TypInfLookupMessageStrategy,
	#superclass : #TypInfMessageStrategy,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfLookupMessageStrategy >> canInstall [
	^ message lookup canResolve
]

{ #category : #accessing }
TypInfLookupMessageStrategy >> contexts [
	| lookup |
	lookup := message lookup resolved.
	^ {lookup -> (lookup resolver typInfContext: lookup)}
]

{ #category : #accessing }
TypInfLookupMessageStrategy >> transfer [
	| method |
	method := message lookup resolve.
	message constrain: message inReceiver to: message constrainedReceiver.
	message inArguments
		withIndexDo: [ :e :i | 
			i <= method arguments size
				ifTrue: [ message constrain: e to: (method arguments at: i) ] ].
	message state at: message put: method result
]
