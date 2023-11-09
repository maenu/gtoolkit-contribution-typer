Class {
	#name : #TypInfExpression,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #compatibility }
TypInfExpression >> asFunction [
	^ BlockClosure typAsFunctionTypeWithResult: self type
]

{ #category : #accessing }
TypInfExpression >> transfer [
	state at: self put: (context nodesAt: node) second type
]
