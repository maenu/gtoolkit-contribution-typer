Class {
	#name : #TypInfFlowAnalysis,
	#superclass : #Object,
	#instVars : [
		'root'
	],
	#category : #'Typer-Inference-Flow'
}

{ #category : #accessing }
TypInfFlowAnalysis class >> root: aNode [

	^ self new
		  initializeRoot: aNode;
		  yourself
]

{ #category : #initialization }
TypInfFlowAnalysis >> initializeRoot: aNode [

	root := aNode
]

{ #category : #'as yet unclassified' }
TypInfFlowAnalysis >> run [

	"for i ← 1 to N
initialize node i
while (sets are still changing)
for i ← 1 to N
recompute sets at node i"
]

{ #category : #'as yet unclassified' }
TypInfFlowAnalysis >> state [

	| state |
	state := IdentityDictionary new.
	root controlFlowNodes do: [ :n | 
		state at: n put: TypUnknownType instance ].
	^ state
]
