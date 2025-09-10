class AdminInvitationPolicy < ApplicationPolicy
  INVITATION_ROLES = %w[superadmin policy_and_abuse].freeze

  def can_invite_from_queue?
    user_has_roles?(INVITATION_ROLES)
  end

  def can_grant_invites?
    user_has_roles?(INVITATION_ROLES)
  end
end
