Class {
	#name : #TypInfNullMessageStrategy,
	#superclass : #TypInfMessageStrategy,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfNullMessageStrategy >> canInstall [
	^ true
]

{ #category : #accessing }
TypInfNullMessageStrategy >> contexts [
	^ {}
]

{ #category : #accessing }
TypInfNullMessageStrategy >> transfer [
	message state at: message put: TypUnknownType instance
]
