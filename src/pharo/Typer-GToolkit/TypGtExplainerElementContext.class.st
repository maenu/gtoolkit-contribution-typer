Class {
	#name : #TypGtExplainerElementContext,
	#superclass : #GtExplainerElementContext,
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtExplainerElementContext >> allExplanationChildrenWithModel: aModel do: aBlock [
	| children |
	children := self element
			allChildrenBreadthFirstSelect: [ :child | 
				child explainer isExplanation
					and: [ self does: child explainer model match: aModel ] ].
	children do: aBlock
]

{ #category : #accessing }
TypGtExplainerElementContext >> allTargetChildrenWithModel: aModel do: aBlock [
	| children |
	children := self element
			allChildrenBreadthFirstSelect: [ :child | child explainer isTarget and: [ self does: child explainer model match: aModel ] ].
	children do: aBlock
]

{ #category : #accessing }
TypGtExplainerElementContext >> does: aModel match: anotherModel [
	^ (aModel asCollection intersection: anotherModel asCollection) isNotEmpty
]

{ #category : #accessing }
TypGtExplainerElementContext >> firstExplanationChildWithModel: aModel do: aBlock [
	^ self element
		allChildrenBreadthFirstDetect: [ :child | 
			child explainer isExplanation
				and: [ self does: child explainer model match: aModel ] ]
		ifFound: aBlock
]

{ #category : #accessing }
TypGtExplainerElementContext >> firstTargetChildWithModel: aModel do: aBlock [
	^ self element
		allChildrenBreadthFirstDetect: [ :child | child explainer isTarget and: [ self does: child explainer model match: aModel ] ]
		ifFound: aBlock
]

{ #category : #accessing }
TypGtExplainerElementContext >> updateValidatorTargetsOf: aModel to: aBoolean [
	self element
		allChildrenBreadthFirstDo: [ :child | 
			(child explainer isValidatorTarget
				and: [ self does: child explainer model match: aModel ])
				ifTrue: [ child fireEvent: (GtValidatorAttributeEvent new hasAttribute: aBoolean) ] ]
]
