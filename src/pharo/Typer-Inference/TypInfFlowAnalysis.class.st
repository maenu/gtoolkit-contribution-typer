Class {
	#name : #TypInfFlowAnalysis,
	#superclass : #Object,
	#instVars : [
		'root',
		'state'
	],
	#category : #'Typer-Inference-Flow'
}

{ #category : #accessing }
TypInfFlowAnalysis class >> root: aNode state: aState [

	^ self new
		  initializeRoot: aNode state: aState;
		  yourself
]

{ #category : #initialization }
TypInfFlowAnalysis >> initializeRoot: aNode state: aState [

	root := aNode.
	state := aState
]

{ #category : #accessing }
TypInfFlowAnalysis >> run [

	| nodes n |
	nodes := root flowNodesAll.
	nodes do: [ :e | state at: e put: (e initialValueIn: self) ].
	nodes do: [ :e | e state: state copy ].
	n := 1000.
	[ 
	n := n - 1.
	(nodes inject: false into: [ :r :e | r or: e slurpAndBurp ]) and: [ 
		n > 0 ] ] whileTrue.
	^ n
]
